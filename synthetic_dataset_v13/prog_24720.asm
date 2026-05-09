; DESCRIPTION: Composite: Places a yellow 36x119 rectangle at position (232, 61) then Places a orange dot at position (225, 142) then Draws a blue line from (337, 126) to (480, 203).
; PLAN: r0=232(x), r1=61(y), r2=36(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=142(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=337(x1), r11=126(y1), r12=480(x2), r13=203(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 61
LDI r2, 36
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 142
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 337
LDI r11, 126
LDI r12, 480
LDI r13, 203
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
