; DESCRIPTION: Composite: Places a magenta line segment connecting (99, 229) to (53, 203) then Creates a black circular shape at (327, 205) with radius 10.
; PLAN: r0=99(x1), r1=229(y1), r2=53(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=205(y), r7=10(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 229
LDI r2, 53
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 205
LDI r7, 10
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
