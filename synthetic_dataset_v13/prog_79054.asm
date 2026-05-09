; DESCRIPTION: Composite: Draws a white rectangle at (324, 140) with width 36 and height 20 then Sets a single yellow pixel at (383, 215) then Creates a red circular shape at (240, 140) with radius 15.
; PLAN: r0=324(x), r1=140(y), r2=36(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=215(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=240(x), r11=140(y), r12=15(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 324
LDI r1, 140
LDI r2, 36
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 215
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 240
LDI r11, 140
LDI r12, 15
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
