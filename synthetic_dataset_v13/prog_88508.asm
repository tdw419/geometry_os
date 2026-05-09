; DESCRIPTION: Composite: Places a cyan dot at position (182, 191) then Creates a blue rectangular region at (351, 201) spanning 109 by 25 pixels then Draws a blue line from (442, 206) to (444, 54).
; PLAN: r0=182(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=201(y), r7=109(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=442(x1), r11=206(y1), r12=444(x2), r13=54(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 182
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 351
LDI r6, 201
LDI r7, 109
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 206
LDI r12, 444
LDI r13, 54
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
