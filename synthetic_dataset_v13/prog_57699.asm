; DESCRIPTION: Composite: Places a blue 73x60 rectangle at position (173, 193) then Sets a single purple pixel at (126, 231) then Renders a white disk with center (353, 174) and radius 80.
; PLAN: r0=173(x), r1=193(y), r2=73(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=353(x), r11=174(y), r12=80(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 193
LDI r2, 73
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 353
LDI r11, 174
LDI r12, 80
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
