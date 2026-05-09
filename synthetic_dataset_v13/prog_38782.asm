; DESCRIPTION: Composite: Places a blue line segment connecting (165, 4) to (458, 173) then Creates a orange rectangular region at (454, 162) spanning 25 by 40 pixels then Sets a single white pixel at (295, 72).
; PLAN: r0=165(x1), r1=4(y1), r2=458(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=454(x), r6=162(y), r7=25(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=295(x), r11=72(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 4
LDI r2, 458
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 162
LDI r7, 25
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 72
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
