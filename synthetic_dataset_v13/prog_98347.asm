; DESCRIPTION: Composite: Draws a red line from (199, 161) to (328, 155) then Places a blue dot at position (191, 233) then Draws a yellow rectangle at (203, 104) with width 37 and height 55.
; PLAN: r0=199(x1), r1=161(y1), r2=328(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=233(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=203(x), r11=104(y), r12=37(width), r13=55(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 161
LDI r2, 328
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 233
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 203
LDI r11, 104
LDI r12, 37
LDI r13, 55
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
