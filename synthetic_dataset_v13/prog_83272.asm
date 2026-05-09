; DESCRIPTION: Composite: Draws a green line from (360, 192) to (444, 91) then Places a magenta 26x69 rectangle at position (12, 14) then Places a green dot at position (164, 131).
; PLAN: r0=360(x1), r1=192(y1), r2=444(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=12(x), r6=14(y), r7=26(width), r8=69(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x), r11=131(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 360
LDI r1, 192
LDI r2, 444
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 14
LDI r7, 26
LDI r8, 69
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 131
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
