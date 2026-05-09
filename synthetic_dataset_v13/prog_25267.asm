; DESCRIPTION: Composite: Renders a purple box of size 45x29 starting at (3, 0) then Places a orange line segment connecting (84, 34) to (471, 32).
; PLAN: r0=3(x), r1=0(y), r2=45(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x1), r6=34(y1), r7=471(x2), r8=32(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 0
LDI r2, 45
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 34
LDI r7, 471
LDI r8, 32
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
