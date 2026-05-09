; DESCRIPTION: Composite: Renders a purple box of size 91x32 starting at (100, 100) then Draws a yellow circle centered at (106, 159) with radius 63.
; PLAN: r0=100(x), r1=100(y), r2=91(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=159(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 100
LDI r1, 100
LDI r2, 91
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 159
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
