; DESCRIPTION: Composite: Places a orange line segment connecting (330, 0) to (496, 79) then Places a magenta circle of radius 25 at center (222, 196).
; PLAN: r0=330(x1), r1=0(y1), r2=496(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=222(x), r6=196(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 0
LDI r2, 496
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 196
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
