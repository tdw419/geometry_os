; DESCRIPTION: Composite: Renders a cyan box of size 38x96 starting at (282, 80) then Sets a single green pixel at (397, 8) then Renders a white disk with center (31, 212) and radius 17.
; PLAN: r0=282(x), r1=80(y), r2=38(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=8(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=31(x), r11=212(y), r12=17(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 282
LDI r1, 80
LDI r2, 38
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 8
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 31
LDI r11, 212
LDI r12, 17
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
