; DESCRIPTION: Composite: Renders a orange line between points (180, 88) and (84, 184) then Places a magenta circle of radius 53 at center (56, 79).
; PLAN: r0=180(x1), r1=88(y1), r2=84(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=79(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 88
LDI r2, 84
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 79
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
