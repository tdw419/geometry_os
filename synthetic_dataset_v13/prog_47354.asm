; DESCRIPTION: Composite: Renders a orange line between points (60, 150) and (492, 54) then Places a black dot at position (192, 185) then Places a purple 94x107 rectangle at position (176, 74).
; PLAN: r0=60(x1), r1=150(y1), r2=492(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=185(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=176(x), r11=74(y), r12=94(width), r13=107(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 150
LDI r2, 492
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 185
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 176
LDI r11, 74
LDI r12, 94
LDI r13, 107
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
