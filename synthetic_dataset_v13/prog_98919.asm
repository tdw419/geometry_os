; DESCRIPTION: Renders a orange line between points (473, 43) and (350, 121).
; PLAN: r0=473(x1), r1=43(y1), r2=350(x2), r3=121(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 43
LDI r2, 350
LDI r3, 121
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
