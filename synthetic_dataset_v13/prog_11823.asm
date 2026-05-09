; DESCRIPTION: Composite: Renders a blue box of size 101x88 starting at (325, 73) then Renders a green disk with center (66, 145) and radius 57.
; PLAN: r0=325(x), r1=73(y), r2=101(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=145(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 325
LDI r1, 73
LDI r2, 101
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 145
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
