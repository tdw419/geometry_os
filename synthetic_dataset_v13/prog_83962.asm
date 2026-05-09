; DESCRIPTION: Composite: Creates a orange rectangular region at (136, 141) spanning 111 by 77 pixels then Sets a single black pixel at (406, 15) then Places a white line segment connecting (369, 49) to (164, 180).
; PLAN: r0=136(x), r1=141(y), r2=111(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x), r6=15(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=369(x1), r11=49(y1), r12=164(x2), r13=180(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 141
LDI r2, 111
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 15
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 369
LDI r11, 49
LDI r12, 164
LDI r13, 180
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
