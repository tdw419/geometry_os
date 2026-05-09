; DESCRIPTION: Composite: Renders a green line between points (107, 152) and (38, 144) then Places a orange 50x89 rectangle at position (355, 39) then Places a yellow circle of radius 32 at center (422, 198).
; PLAN: r0=107(x1), r1=152(y1), r2=38(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=39(y), r7=50(width), r8=89(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=422(x), r11=198(y), r12=32(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 107
LDI r1, 152
LDI r2, 38
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 39
LDI r7, 50
LDI r8, 89
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 198
LDI r12, 32
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
