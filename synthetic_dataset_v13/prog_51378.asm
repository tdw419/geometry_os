; DESCRIPTION: Composite: Places a orange circle of radius 71 at center (96, 168) then Creates a orange rectangular region at (48, 110) spanning 46 by 26 pixels then Draws a white line from (206, 253) to (505, 31).
; PLAN: r0=96(x), r1=168(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=110(y), r7=46(width), r8=26(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x1), r11=253(y1), r12=505(x2), r13=31(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 168
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 110
LDI r7, 46
LDI r8, 26
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 253
LDI r12, 505
LDI r13, 31
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
