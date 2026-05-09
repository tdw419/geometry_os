; DESCRIPTION: Composite: Places a red dot at position (63, 46) then Draws a blue line from (407, 29) to (206, 204) then Creates a magenta rectangular region at (68, 147) spanning 81 by 99 pixels.
; PLAN: r0=63(x), r1=46(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=407(x1), r6=29(y1), r7=206(x2), r8=204(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=147(y), r12=81(width), r13=99(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 46
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 407
LDI r6, 29
LDI r7, 206
LDI r8, 204
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 147
LDI r12, 81
LDI r13, 99
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
