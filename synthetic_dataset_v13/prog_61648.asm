; DESCRIPTION: Composite: Renders a purple line between points (211, 39) and (290, 16) then Sets a single orange pixel at (390, 207) then Places a orange 52x62 rectangle at position (210, 17).
; PLAN: r0=211(x1), r1=39(y1), r2=290(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=390(x), r6=207(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=17(y), r12=52(width), r13=62(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 39
LDI r2, 290
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 207
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 210
LDI r11, 17
LDI r12, 52
LDI r13, 62
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
