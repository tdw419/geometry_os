; DESCRIPTION: Composite: Draws a orange line from (331, 228) to (287, 176) then Draws a orange rectangle at (269, 68) with width 114 and height 47 then Renders a purple disk with center (470, 94) and radius 32.
; PLAN: r0=331(x1), r1=228(y1), r2=287(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=68(y), r7=114(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=94(y), r12=32(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 331
LDI r1, 228
LDI r2, 287
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 68
LDI r7, 114
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 94
LDI r12, 32
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
