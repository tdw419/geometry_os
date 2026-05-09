; DESCRIPTION: Composite: Places a red dot at position (34, 204) then Creates a blue rectangular region at (77, 145) spanning 23 by 84 pixels then Draws a green line from (264, 56) to (349, 173).
; PLAN: r0=34(x), r1=204(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=77(x), r6=145(y), r7=23(width), r8=84(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=264(x1), r11=56(y1), r12=349(x2), r13=173(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 204
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 77
LDI r6, 145
LDI r7, 23
LDI r8, 84
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 56
LDI r12, 349
LDI r13, 173
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
