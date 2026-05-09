; DESCRIPTION: Composite: Places a blue dot at position (122, 170) then Creates a purple rectangular region at (445, 216) spanning 48 by 14 pixels then Places a white line segment connecting (200, 83) to (322, 201).
; PLAN: r0=122(x), r1=170(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=445(x), r6=216(y), r7=48(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=83(y1), r12=322(x2), r13=201(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 122
LDI r1, 170
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 445
LDI r6, 216
LDI r7, 48
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 83
LDI r12, 322
LDI r13, 201
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
