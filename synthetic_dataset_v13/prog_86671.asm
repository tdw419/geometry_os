; DESCRIPTION: Composite: Sets a single purple pixel at (356, 67) then Creates a yellow rectangular region at (140, 27) spanning 50 by 110 pixels then Draws a green line from (346, 90) to (428, 15).
; PLAN: r0=356(x), r1=67(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=27(y), r7=50(width), r8=110(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=346(x1), r11=90(y1), r12=428(x2), r13=15(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 67
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 140
LDI r6, 27
LDI r7, 50
LDI r8, 110
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 90
LDI r12, 428
LDI r13, 15
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
