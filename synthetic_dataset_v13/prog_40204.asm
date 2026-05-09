; DESCRIPTION: Composite: Places a magenta line segment connecting (193, 230) to (208, 203) then Places a green dot at position (198, 19) then Draws a blue rectangle at (80, 95) with width 31 and height 37.
; PLAN: r0=193(x1), r1=230(y1), r2=208(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=19(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=80(x), r11=95(y), r12=31(width), r13=37(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 230
LDI r2, 208
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 19
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 80
LDI r11, 95
LDI r12, 31
LDI r13, 37
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
