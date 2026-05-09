; DESCRIPTION: Composite: Draws a magenta circle centered at (215, 99) with radius 68 then Renders a yellow box of size 32x96 starting at (34, 112).
; PLAN: r0=215(x), r1=99(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=112(y), r7=32(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 99
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 112
LDI r7, 32
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
