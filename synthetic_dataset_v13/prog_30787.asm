; DESCRIPTION: Composite: Places a orange circle of radius 63 at center (76, 96) then Places a orange line segment connecting (433, 34) to (455, 143) then Places a orange dot at position (39, 67).
; PLAN: r0=76(x), r1=96(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=34(y1), r7=455(x2), r8=143(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=39(x), r11=67(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 76
LDI r1, 96
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 34
LDI r7, 455
LDI r8, 143
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 67
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
