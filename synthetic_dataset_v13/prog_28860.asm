; DESCRIPTION: Composite: Creates a white rectangular region at (152, 44) spanning 37 by 20 pixels then Places a blue dot at position (343, 232) then Draws a blue line from (232, 30) to (411, 178).
; PLAN: r0=152(x), r1=44(y), r2=37(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=343(x), r6=232(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=232(x1), r11=30(y1), r12=411(x2), r13=178(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 44
LDI r2, 37
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 232
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 232
LDI r11, 30
LDI r12, 411
LDI r13, 178
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
