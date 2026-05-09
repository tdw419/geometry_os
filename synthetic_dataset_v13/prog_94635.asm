; DESCRIPTION: Composite: Draws a purple line from (295, 103) to (480, 245) then Places a white 41x15 rectangle at position (212, 240) then Renders a yellow disk with center (308, 136) and radius 47.
; PLAN: r0=295(x1), r1=103(y1), r2=480(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=240(y), r7=41(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=136(y), r12=47(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 295
LDI r1, 103
LDI r2, 480
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 240
LDI r7, 41
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 136
LDI r12, 47
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
