; DESCRIPTION: Composite: Places a orange line segment connecting (352, 217) to (19, 44) then Places a black circle of radius 63 at center (83, 67) then Places a orange dot at position (154, 252).
; PLAN: r0=352(x1), r1=217(y1), r2=19(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=83(x), r6=67(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=252(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 352
LDI r1, 217
LDI r2, 19
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 83
LDI r6, 67
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 252
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
