; DESCRIPTION: Composite: Sets a single orange pixel at (408, 234) then Renders a orange line between points (337, 19) and (493, 97) then Creates a cyan rectangular region at (381, 54) spanning 47 by 89 pixels.
; PLAN: r0=408(x), r1=234(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=19(y1), r7=493(x2), r8=97(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=381(x), r11=54(y), r12=47(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 408
LDI r1, 234
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 337
LDI r6, 19
LDI r7, 493
LDI r8, 97
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 381
LDI r11, 54
LDI r12, 47
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
