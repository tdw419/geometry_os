; DESCRIPTION: Composite: Creates a orange rectangular region at (290, 164) spanning 26 by 66 pixels then Renders a purple line between points (290, 6) and (308, 96) then Places a cyan dot at position (490, 61).
; PLAN: r0=290(x), r1=164(y), r2=26(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=6(y1), r7=308(x2), r8=96(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=61(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 290
LDI r1, 164
LDI r2, 26
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 6
LDI r7, 308
LDI r8, 96
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 61
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
