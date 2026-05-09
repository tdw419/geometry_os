; DESCRIPTION: Composite: Creates a magenta circular shape at (416, 72) with radius 51 then Places a orange line segment connecting (328, 45) to (280, 157).
; PLAN: r0=416(x), r1=72(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=328(x1), r6=45(y1), r7=280(x2), r8=157(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 72
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 328
LDI r6, 45
LDI r7, 280
LDI r8, 157
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
