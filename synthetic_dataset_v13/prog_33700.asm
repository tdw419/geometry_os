; DESCRIPTION: Composite: Places a white 16x70 rectangle at position (203, 173) then Places a purple circle of radius 52 at center (417, 170) then Places a blue dot at position (338, 112).
; PLAN: r0=203(x), r1=173(y), r2=16(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=170(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=112(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 173
LDI r2, 16
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 170
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 112
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
