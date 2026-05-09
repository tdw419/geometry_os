; DESCRIPTION: Composite: Places a magenta line segment connecting (174, 187) to (242, 157) then Creates a blue rectangular region at (88, 9) spanning 110 by 60 pixels then Places a blue dot at position (371, 157).
; PLAN: r0=174(x1), r1=187(y1), r2=242(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=88(x), r6=9(y), r7=110(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=157(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 187
LDI r2, 242
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 9
LDI r7, 110
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 157
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
