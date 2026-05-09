; DESCRIPTION: Composite: Places a magenta dot at position (426, 157) then Draws a black line from (271, 106) to (433, 170) then Creates a orange rectangular region at (123, 108) spanning 41 by 108 pixels.
; PLAN: r0=426(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=271(x1), r6=106(y1), r7=433(x2), r8=170(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=108(y), r12=41(width), r13=108(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 271
LDI r6, 106
LDI r7, 433
LDI r8, 170
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 108
LDI r12, 41
LDI r13, 108
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
