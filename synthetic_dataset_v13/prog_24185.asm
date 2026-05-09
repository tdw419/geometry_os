; DESCRIPTION: Composite: Sets a single purple pixel at (388, 157) then Places a yellow line segment connecting (215, 185) to (92, 38) then Creates a purple rectangular region at (310, 65) spanning 67 by 51 pixels.
; PLAN: r0=388(x), r1=157(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=215(x1), r6=185(y1), r7=92(x2), r8=38(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=65(y), r12=67(width), r13=51(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 157
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 215
LDI r6, 185
LDI r7, 92
LDI r8, 38
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 65
LDI r12, 67
LDI r13, 51
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
