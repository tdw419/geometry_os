; DESCRIPTION: Composite: Places a red 58x27 rectangle at position (373, 222) then Renders a purple disk with center (184, 83) and radius 80 then Sets a single black pixel at (425, 199).
; PLAN: r0=373(x), r1=222(y), r2=58(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=83(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=425(x), r11=199(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 222
LDI r2, 58
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 83
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 425
LDI r11, 199
LDI r12, 0x000000
PSET r10, r11, r12
HALT
