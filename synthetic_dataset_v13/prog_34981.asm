; DESCRIPTION: Composite: Places a white 107x18 rectangle at position (241, 56) then Places a orange dot at position (422, 238) then Draws a green line from (400, 89) to (257, 5).
; PLAN: r0=241(x), r1=56(y), r2=107(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=400(x1), r11=89(y1), r12=257(x2), r13=5(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 56
LDI r2, 107
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 400
LDI r11, 89
LDI r12, 257
LDI r13, 5
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
