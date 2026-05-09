; DESCRIPTION: Composite: Renders a green line between points (49, 201) and (176, 136) then Sets a single orange pixel at (355, 135) then Places a blue 40x14 rectangle at position (146, 50).
; PLAN: r0=49(x1), r1=201(y1), r2=176(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=135(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=146(x), r11=50(y), r12=40(width), r13=14(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 201
LDI r2, 176
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 135
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 146
LDI r11, 50
LDI r12, 40
LDI r13, 14
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
