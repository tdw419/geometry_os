; DESCRIPTION: Composite: Places a orange 85x90 rectangle at position (318, 139) then Draws a cyan line from (339, 215) to (395, 110).
; PLAN: r0=318(x), r1=139(y), r2=85(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x1), r6=215(y1), r7=395(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 139
LDI r2, 85
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 215
LDI r7, 395
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
