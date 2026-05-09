; DESCRIPTION: Composite: Places a green line segment connecting (270, 135) to (335, 199) then Creates a purple rectangular region at (185, 117) spanning 84 by 108 pixels then Places a white dot at position (234, 111).
; PLAN: r0=270(x1), r1=135(y1), r2=335(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=117(y), r7=84(width), r8=108(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=111(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 135
LDI r2, 335
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 117
LDI r7, 84
LDI r8, 108
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 111
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
