; DESCRIPTION: Composite: Draws a black rectangle at (80, 137) with width 60 and height 35 then Sets a single yellow pixel at (360, 147).
; PLAN: r0=80(x), r1=137(y), r2=60(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=147(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 80
LDI r1, 137
LDI r2, 60
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 147
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
