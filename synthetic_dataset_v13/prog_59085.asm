; DESCRIPTION: Composite: Places a orange 15x61 rectangle at position (66, 46) then Places a cyan dot at position (418, 48) then Places a white circle of radius 71 at center (239, 159).
; PLAN: r0=66(x), r1=46(y), r2=15(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=239(x), r11=159(y), r12=71(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 66
LDI r1, 46
LDI r2, 15
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 239
LDI r11, 159
LDI r12, 71
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
