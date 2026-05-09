; DESCRIPTION: Composite: Places a red circle of radius 80 at center (363, 136) then Sets a single red pixel at (64, 144) then Places a cyan 44x109 rectangle at position (8, 131).
; PLAN: r0=363(x), r1=136(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x), r6=144(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=8(x), r11=131(y), r12=44(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 363
LDI r1, 136
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 144
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 8
LDI r11, 131
LDI r12, 44
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
