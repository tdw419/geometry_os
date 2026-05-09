; DESCRIPTION: Composite: Creates a magenta rectangular region at (248, 112) spanning 83 by 111 pixels then Places a black line segment connecting (61, 3) to (332, 166) then Sets a single orange pixel at (428, 173).
; PLAN: r0=248(x), r1=112(y), r2=83(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=3(y1), r7=332(x2), r8=166(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=428(x), r11=173(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 112
LDI r2, 83
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 3
LDI r7, 332
LDI r8, 166
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 428
LDI r11, 173
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
