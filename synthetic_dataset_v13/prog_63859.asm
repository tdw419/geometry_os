; DESCRIPTION: Composite: Draws a white circle centered at (428, 171) with radius 75 then Draws a blue line from (229, 175) to (370, 236) then Places a orange 15x65 rectangle at position (408, 45).
; PLAN: r0=428(x), r1=171(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x1), r6=175(y1), r7=370(x2), r8=236(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=45(y), r12=15(width), r13=65(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 171
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 175
LDI r7, 370
LDI r8, 236
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 45
LDI r12, 15
LDI r13, 65
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
