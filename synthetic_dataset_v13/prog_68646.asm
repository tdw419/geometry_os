; DESCRIPTION: Composite: Places a red 59x13 rectangle at position (244, 123) then Sets a single cyan pixel at (455, 145) then Places a blue circle of radius 78 at center (429, 107).
; PLAN: r0=244(x), r1=123(y), r2=59(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=455(x), r6=145(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=429(x), r11=107(y), r12=78(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 123
LDI r2, 59
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 145
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 429
LDI r11, 107
LDI r12, 78
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
