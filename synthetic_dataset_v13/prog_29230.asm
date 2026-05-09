; DESCRIPTION: Composite: Creates a white rectangular region at (143, 62) spanning 111 by 104 pixels then Renders a orange line between points (420, 44) and (375, 241) then Sets a single purple pixel at (259, 79).
; PLAN: r0=143(x), r1=62(y), r2=111(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=420(x1), r6=44(y1), r7=375(x2), r8=241(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=259(x), r11=79(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 62
LDI r2, 111
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 44
LDI r7, 375
LDI r8, 241
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 79
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
