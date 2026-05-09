; DESCRIPTION: Composite: Creates a magenta circular shape at (341, 188) with radius 46 then Renders a purple box of size 64x92 starting at (136, 21).
; PLAN: r0=341(x), r1=188(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=21(y), r7=64(width), r8=92(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 188
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 21
LDI r7, 64
LDI r8, 92
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
