; DESCRIPTION: Composite: Places a cyan dot at position (438, 186) then Draws a black circle centered at (420, 192) with radius 24 then Places a orange 15x50 rectangle at position (418, 20).
; PLAN: r0=438(x), r1=186(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=192(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=418(x), r11=20(y), r12=15(width), r13=50(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 438
LDI r1, 186
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 420
LDI r6, 192
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 418
LDI r11, 20
LDI r12, 15
LDI r13, 50
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
