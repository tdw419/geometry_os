; DESCRIPTION: Composite: Draws a blue line from (426, 171) to (79, 231) then Places a green dot at position (235, 108) then Creates a yellow rectangular region at (154, 172) spanning 44 by 14 pixels.
; PLAN: r0=426(x1), r1=171(y1), r2=79(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=235(x), r6=108(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=154(x), r11=172(y), r12=44(width), r13=14(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 171
LDI r2, 79
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 235
LDI r6, 108
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 154
LDI r11, 172
LDI r12, 44
LDI r13, 14
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
