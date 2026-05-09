; DESCRIPTION: Composite: Renders a red disk with center (378, 48) and radius 17 then Renders a blue box of size 102x29 starting at (283, 96).
; PLAN: r0=378(x), r1=48(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=96(y), r7=102(width), r8=29(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 48
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 96
LDI r7, 102
LDI r8, 29
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
