; DESCRIPTION: Composite: Places a blue circle of radius 65 at center (433, 104) then Places a black dot at position (109, 213) then Places a white 84x99 rectangle at position (232, 150).
; PLAN: r0=433(x), r1=104(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=213(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=232(x), r11=150(y), r12=84(width), r13=99(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 104
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 213
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 232
LDI r11, 150
LDI r12, 84
LDI r13, 99
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
