; DESCRIPTION: Renders a black line between points (105, 12) and (395, 16).
; PLAN: r0=105(x1), r1=12(y1), r2=395(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 12
LDI r2, 395
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
