; DESCRIPTION: Renders a black line between points (0, 70) and (303, 98).
; PLAN: r0=0(x1), r1=70(y1), r2=303(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 70
LDI r2, 303
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
