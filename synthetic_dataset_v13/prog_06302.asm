; DESCRIPTION: Composite: Places a orange line segment connecting (34, 224) to (107, 51) then Places a cyan 110x44 rectangle at position (26, 162).
; PLAN: r0=34(x1), r1=224(y1), r2=107(x2), r3=51(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=26(x), r6=162(y), r7=110(width), r8=44(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 224
LDI r2, 107
LDI r3, 51
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 162
LDI r7, 110
LDI r8, 44
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
