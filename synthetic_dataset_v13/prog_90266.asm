; DESCRIPTION: Composite: Places a orange line segment connecting (44, 53) to (171, 117) then Sets a single black pixel at (470, 194) then Creates a cyan rectangular region at (419, 67) spanning 56 by 86 pixels.
; PLAN: r0=44(x1), r1=53(y1), r2=171(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=67(y), r12=56(width), r13=86(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 44
LDI r1, 53
LDI r2, 171
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 419
LDI r11, 67
LDI r12, 56
LDI r13, 86
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
