; DESCRIPTION: Composite: Renders a yellow box of size 99x46 starting at (114, 95) then Draws a magenta circle centered at (220, 123) with radius 31.
; PLAN: r0=114(x), r1=95(y), r2=99(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=123(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 95
LDI r2, 99
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 123
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
