; DESCRIPTION: Composite: Draws a green rectangle at (429, 22) with width 22 and height 94 then Draws a orange line from (42, 45) to (45, 96).
; PLAN: r0=429(x), r1=22(y), r2=22(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=42(x1), r6=45(y1), r7=45(x2), r8=96(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 429
LDI r1, 22
LDI r2, 22
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 45
LDI r7, 45
LDI r8, 96
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
