; DESCRIPTION: Composite: Creates a purple rectangular region at (285, 55) spanning 72 by 46 pixels then Places a blue line segment connecting (461, 109) to (390, 166).
; PLAN: r0=285(x), r1=55(y), r2=72(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x1), r6=109(y1), r7=390(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 55
LDI r2, 72
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 109
LDI r7, 390
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
