; DESCRIPTION: Composite: Sets a single white pixel at (158, 220) then Draws a white line from (353, 36) to (202, 144) then Renders a blue box of size 72x36 starting at (351, 110).
; PLAN: r0=158(x), r1=220(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=353(x1), r6=36(y1), r7=202(x2), r8=144(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=110(y), r12=72(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 220
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 353
LDI r6, 36
LDI r7, 202
LDI r8, 144
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 110
LDI r12, 72
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
