; DESCRIPTION: Composite: Places a red dot at position (165, 255) then Places a yellow line segment connecting (407, 60) to (273, 159) then Draws a blue rectangle at (66, 117) with width 79 and height 103.
; PLAN: r0=165(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=60(y1), r7=273(x2), r8=159(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=66(x), r11=117(y), r12=79(width), r13=103(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 255
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 60
LDI r7, 273
LDI r8, 159
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 117
LDI r12, 79
LDI r13, 103
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
