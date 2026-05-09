; DESCRIPTION: Composite: Sets a single cyan pixel at (480, 24) then Creates a white rectangular region at (72, 139) spanning 70 by 67 pixels then Draws a magenta line from (81, 157) to (147, 8).
; PLAN: r0=480(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=72(x), r6=139(y), r7=70(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x1), r11=157(y1), r12=147(x2), r13=8(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 480
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 72
LDI r6, 139
LDI r7, 70
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 157
LDI r12, 147
LDI r13, 8
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
