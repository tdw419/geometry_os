; DESCRIPTION: Composite: Places a orange dot at position (135, 230) then Creates a green rectangular region at (188, 145) spanning 45 by 15 pixels then Renders a red line between points (273, 90) and (445, 222).
; PLAN: r0=135(x), r1=230(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=145(y), r7=45(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x1), r11=90(y1), r12=445(x2), r13=222(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 135
LDI r1, 230
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 188
LDI r6, 145
LDI r7, 45
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 90
LDI r12, 445
LDI r13, 222
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
