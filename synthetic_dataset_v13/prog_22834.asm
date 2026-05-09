; DESCRIPTION: Composite: Places a green dot at position (458, 48) then Creates a cyan rectangular region at (57, 54) spanning 104 by 106 pixels then Renders a purple line between points (451, 119) and (204, 212).
; PLAN: r0=458(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=54(y), r7=104(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x1), r11=119(y1), r12=204(x2), r13=212(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 458
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 57
LDI r6, 54
LDI r7, 104
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 119
LDI r12, 204
LDI r13, 212
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
