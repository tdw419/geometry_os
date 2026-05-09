; DESCRIPTION: Composite: Sets a single cyan pixel at (318, 34) then Creates a blue rectangular region at (322, 133) spanning 75 by 104 pixels then Places a cyan line segment connecting (166, 87) to (403, 5).
; PLAN: r0=318(x), r1=34(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=322(x), r6=133(y), r7=75(width), r8=104(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x1), r11=87(y1), r12=403(x2), r13=5(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 34
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 322
LDI r6, 133
LDI r7, 75
LDI r8, 104
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 87
LDI r12, 403
LDI r13, 5
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
