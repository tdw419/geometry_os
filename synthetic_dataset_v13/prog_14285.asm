; DESCRIPTION: Composite: Sets a single cyan pixel at (436, 117) then Creates a orange rectangular region at (59, 173) spanning 25 by 44 pixels then Renders a purple line between points (490, 57) and (153, 166).
; PLAN: r0=436(x), r1=117(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=173(y), r7=25(width), r8=44(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=490(x1), r11=57(y1), r12=153(x2), r13=166(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 117
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 173
LDI r7, 25
LDI r8, 44
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 57
LDI r12, 153
LDI r13, 166
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
