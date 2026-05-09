; DESCRIPTION: Composite: Sets a single purple pixel at (478, 107) then Places a white line segment connecting (96, 174) to (112, 88) then Creates a purple rectangular region at (169, 75) spanning 69 by 67 pixels.
; PLAN: r0=478(x), r1=107(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=96(x1), r6=174(y1), r7=112(x2), r8=88(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=169(x), r11=75(y), r12=69(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 478
LDI r1, 107
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 96
LDI r6, 174
LDI r7, 112
LDI r8, 88
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 75
LDI r12, 69
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
