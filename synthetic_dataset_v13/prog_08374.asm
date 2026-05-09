; DESCRIPTION: Composite: Places a orange dot at position (5, 120) then Places a purple line segment connecting (472, 101) to (246, 171) then Creates a purple rectangular region at (294, 216) spanning 59 by 37 pixels.
; PLAN: r0=5(x), r1=120(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=472(x1), r6=101(y1), r7=246(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=294(x), r11=216(y), r12=59(width), r13=37(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 120
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 472
LDI r6, 101
LDI r7, 246
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 216
LDI r12, 59
LDI r13, 37
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
