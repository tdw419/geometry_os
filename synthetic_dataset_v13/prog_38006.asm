; DESCRIPTION: Composite: Places a black 24x30 rectangle at position (225, 185) then Draws a black circle centered at (222, 16) with radius 12 then Sets a single green pixel at (306, 200).
; PLAN: r0=225(x), r1=185(y), r2=24(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=16(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=200(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 185
LDI r2, 24
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 16
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 200
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
