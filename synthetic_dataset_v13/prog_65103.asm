; DESCRIPTION: Composite: Draws a white line from (171, 174) to (55, 245) then Sets a single cyan pixel at (31, 203) then Places a white circle of radius 57 at center (454, 87).
; PLAN: r0=171(x1), r1=174(y1), r2=55(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=31(x), r6=203(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=454(x), r11=87(y), r12=57(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 171
LDI r1, 174
LDI r2, 55
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 203
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 454
LDI r11, 87
LDI r12, 57
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
