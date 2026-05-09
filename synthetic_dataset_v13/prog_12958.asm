; DESCRIPTION: Composite: Places a blue circle of radius 17 at center (465, 162) then Places a green 107x115 rectangle at position (108, 123) then Sets a single red pixel at (378, 240).
; PLAN: r0=465(x), r1=162(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=123(y), r7=107(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=240(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 465
LDI r1, 162
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 123
LDI r7, 107
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 240
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
