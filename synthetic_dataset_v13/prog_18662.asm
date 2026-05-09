; DESCRIPTION: Composite: Draws a magenta circle centered at (189, 83) with radius 74 then Places a magenta 91x13 rectangle at position (408, 172) then Draws a cyan line from (467, 187) to (23, 251).
; PLAN: r0=189(x), r1=83(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=408(x), r6=172(y), r7=91(width), r8=13(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=467(x1), r11=187(y1), r12=23(x2), r13=251(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 189
LDI r1, 83
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 408
LDI r6, 172
LDI r7, 91
LDI r8, 13
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 467
LDI r11, 187
LDI r12, 23
LDI r13, 251
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
