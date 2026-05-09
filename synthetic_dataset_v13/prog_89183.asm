; DESCRIPTION: Composite: Draws a orange circle centered at (414, 140) with radius 36 then Draws a white line from (390, 128) to (392, 212) then Places a blue 84x19 rectangle at position (151, 193).
; PLAN: r0=414(x), r1=140(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=390(x1), r6=128(y1), r7=392(x2), r8=212(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=151(x), r11=193(y), r12=84(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 140
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 390
LDI r6, 128
LDI r7, 392
LDI r8, 212
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 151
LDI r11, 193
LDI r12, 84
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
