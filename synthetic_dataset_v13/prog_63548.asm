; DESCRIPTION: Composite: Places a black circle of radius 34 at center (218, 207) then Places a orange 11x80 rectangle at position (340, 111) then Sets a single orange pixel at (171, 232).
; PLAN: r0=218(x), r1=207(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x), r6=111(y), r7=11(width), r8=80(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=232(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 207
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 111
LDI r7, 11
LDI r8, 80
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 232
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
