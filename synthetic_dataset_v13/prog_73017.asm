; DESCRIPTION: Renders a black line between points (410, 29) and (243, 71).
; PLAN: r0=410(x1), r1=29(y1), r2=243(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 29
LDI r2, 243
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
