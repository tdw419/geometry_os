; DESCRIPTION: Composite: Draws a orange line from (11, 247) to (188, 179) then Renders a cyan box of size 82x16 starting at (158, 156).
; PLAN: r0=11(x1), r1=247(y1), r2=188(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=156(y), r7=82(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 11
LDI r1, 247
LDI r2, 188
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 156
LDI r7, 82
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
