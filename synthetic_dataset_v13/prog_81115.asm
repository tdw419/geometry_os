; DESCRIPTION: Composite: Renders a black disk with center (325, 137) and radius 75 then Renders a magenta box of size 92x22 starting at (60, 49).
; PLAN: r0=325(x), r1=137(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=49(y), r7=92(width), r8=22(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 137
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 49
LDI r7, 92
LDI r8, 22
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
