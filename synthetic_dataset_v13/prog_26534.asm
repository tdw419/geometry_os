; DESCRIPTION: Composite: Places a blue line segment connecting (427, 193) to (40, 80) then Places a blue dot at position (102, 250) then Creates a cyan rectangular region at (77, 173) spanning 78 by 71 pixels.
; PLAN: r0=427(x1), r1=193(y1), r2=40(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=250(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=173(y), r12=78(width), r13=71(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 193
LDI r2, 40
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 250
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 77
LDI r11, 173
LDI r12, 78
LDI r13, 71
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
