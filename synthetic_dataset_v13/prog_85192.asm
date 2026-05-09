; DESCRIPTION: Composite: Renders a yellow line between points (403, 64) and (390, 232) then Places a orange dot at position (25, 185) then Places a magenta 34x44 rectangle at position (425, 13).
; PLAN: r0=403(x1), r1=64(y1), r2=390(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=185(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=13(y), r12=34(width), r13=44(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 64
LDI r2, 390
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 185
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 425
LDI r11, 13
LDI r12, 34
LDI r13, 44
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
