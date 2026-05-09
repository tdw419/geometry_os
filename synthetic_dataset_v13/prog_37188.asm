; DESCRIPTION: Composite: Draws a black rectangle at (200, 21) with width 96 and height 85 then Sets a single green pixel at (16, 31).
; PLAN: r0=200(x), r1=21(y), r2=96(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=31(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 200
LDI r1, 21
LDI r2, 96
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 31
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
