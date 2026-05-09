; DESCRIPTION: Composite: Places a red line segment connecting (290, 105) to (345, 31) then Places a blue 119x21 rectangle at position (244, 117) then Sets a single blue pixel at (275, 15).
; PLAN: r0=290(x1), r1=105(y1), r2=345(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=117(y), r7=119(width), r8=21(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=275(x), r11=15(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 105
LDI r2, 345
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 117
LDI r7, 119
LDI r8, 21
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 15
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
