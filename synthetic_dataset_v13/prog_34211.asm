; DESCRIPTION: Composite: Sets a single purple pixel at (450, 96) then Draws a red line from (206, 21) to (357, 9) then Draws a yellow rectangle at (331, 58) with width 60 and height 53.
; PLAN: r0=450(x), r1=96(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=206(x1), r6=21(y1), r7=357(x2), r8=9(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=331(x), r11=58(y), r12=60(width), r13=53(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 96
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 21
LDI r7, 357
LDI r8, 9
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 58
LDI r12, 60
LDI r13, 53
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
