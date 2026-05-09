; DESCRIPTION: Composite: Places a white line segment connecting (308, 106) to (87, 87) then Places a red dot at position (156, 104) then Renders a cyan box of size 31x79 starting at (87, 87).
; PLAN: r0=308(x1), r1=106(y1), r2=87(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=104(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=87(y), r12=31(width), r13=79(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 106
LDI r2, 87
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 104
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 87
LDI r11, 87
LDI r12, 31
LDI r13, 79
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
