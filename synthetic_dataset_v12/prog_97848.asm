; DESCRIPTION: Composite: Renders a blue box of size 107x37 starting at (369, 31) then Places a magenta dot at position (229, 223) then Draws a orange line from (511, 224) to (295, 162).
; PLAN: r0=369(x), r1=31(y), r2=107(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=223(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=511(x1), r11=224(y1), r12=295(x2), r13=162(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 31
LDI r2, 107
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 223
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 511
LDI r11, 224
LDI r12, 295
LDI r13, 162
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
