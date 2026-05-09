; DESCRIPTION: Composite: Places a orange line segment connecting (26, 242) to (471, 58) then Renders a magenta disk with center (128, 123) and radius 63.
; PLAN: r0=26(x1), r1=242(y1), r2=471(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=123(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 242
LDI r2, 471
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 123
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
