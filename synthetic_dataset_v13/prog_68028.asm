; DESCRIPTION: Composite: Places a purple dot at position (249, 13) then Places a purple 52x84 rectangle at position (167, 21) then Renders a orange disk with center (422, 95) and radius 11.
; PLAN: r0=249(x), r1=13(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=21(y), r7=52(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=95(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 249
LDI r1, 13
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 21
LDI r7, 52
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 95
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
