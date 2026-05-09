; DESCRIPTION: Composite: Places a magenta line segment connecting (259, 98) to (31, 131) then Places a cyan 32x26 rectangle at position (428, 79) then Draws a red circle centered at (259, 197) with radius 41.
; PLAN: r0=259(x1), r1=98(y1), r2=31(x2), r3=131(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=79(y), r7=32(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=259(x), r11=197(y), r12=41(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 98
LDI r2, 31
LDI r3, 131
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 79
LDI r7, 32
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 259
LDI r11, 197
LDI r12, 41
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
