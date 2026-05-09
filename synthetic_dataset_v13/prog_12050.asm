; DESCRIPTION: Composite: Draws a orange line from (346, 57) to (352, 191) then Places a white dot at position (450, 78) then Creates a green circular shape at (143, 73) with radius 62.
; PLAN: r0=346(x1), r1=57(y1), r2=352(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=78(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=73(y), r12=62(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 57
LDI r2, 352
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 78
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 73
LDI r12, 62
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
