; DESCRIPTION: Composite: Sets a single green pixel at (247, 64) then Draws a black rectangle at (178, 13) with width 118 and height 75 then Places a magenta line segment connecting (115, 163) to (91, 133).
; PLAN: r0=247(x), r1=64(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=178(x), r6=13(y), r7=118(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=115(x1), r11=163(y1), r12=91(x2), r13=133(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 64
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 178
LDI r6, 13
LDI r7, 118
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 115
LDI r11, 163
LDI r12, 91
LDI r13, 133
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
