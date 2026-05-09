; DESCRIPTION: Composite: Renders a blue box of size 34x21 starting at (192, 141) then Draws a black circle centered at (273, 138) with radius 57.
; PLAN: r0=192(x), r1=141(y), r2=34(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=138(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 141
LDI r2, 34
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 138
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
