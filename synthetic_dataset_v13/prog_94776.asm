; DESCRIPTION: Composite: Renders a white box of size 61x21 starting at (225, 106) then Renders a black disk with center (144, 212) and radius 20.
; PLAN: r0=225(x), r1=106(y), r2=61(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=144(x), r6=212(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 225
LDI r1, 106
LDI r2, 61
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 212
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
