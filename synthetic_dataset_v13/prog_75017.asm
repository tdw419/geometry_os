; DESCRIPTION: Composite: Creates a orange circular shape at (449, 117) with radius 61 then Sets a single green pixel at (232, 109) then Places a cyan 112x62 rectangle at position (54, 107).
; PLAN: r0=449(x), r1=117(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=232(x), r6=109(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=54(x), r11=107(y), r12=112(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 449
LDI r1, 117
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 232
LDI r6, 109
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 54
LDI r11, 107
LDI r12, 112
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
