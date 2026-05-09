; DESCRIPTION: Composite: Places a blue dot at position (68, 110) then Draws a black line from (56, 162) to (305, 24) then Creates a cyan rectangular region at (49, 35) spanning 90 by 38 pixels.
; PLAN: r0=68(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=162(y1), r7=305(x2), r8=24(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=35(y), r12=90(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 56
LDI r6, 162
LDI r7, 305
LDI r8, 24
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 35
LDI r12, 90
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
