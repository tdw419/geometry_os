; DESCRIPTION: Renders a black line between points (43, 57) and (4, 161).
; PLAN: r0=43(x1), r1=57(y1), r2=4(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 57
LDI r2, 4
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
