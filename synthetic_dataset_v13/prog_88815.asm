; DESCRIPTION: Composite: Sets a single cyan pixel at (193, 255) then Draws a orange line from (131, 36) to (154, 66) then Creates a green circular shape at (435, 157) with radius 69.
; PLAN: r0=193(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=131(x1), r6=36(y1), r7=154(x2), r8=66(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=157(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 36
LDI r7, 154
LDI r8, 66
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 157
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
