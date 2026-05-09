; DESCRIPTION: Composite: Places a orange dot at position (394, 251) then Places a blue line segment connecting (510, 39) to (333, 36) then Creates a white circular shape at (214, 157) with radius 78.
; PLAN: r0=394(x), r1=251(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=510(x1), r6=39(y1), r7=333(x2), r8=36(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=214(x), r11=157(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 251
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 510
LDI r6, 39
LDI r7, 333
LDI r8, 36
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 214
LDI r11, 157
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
