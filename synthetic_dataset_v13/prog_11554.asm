; DESCRIPTION: Composite: Places a magenta 81x78 rectangle at position (292, 172) then Draws a cyan line from (394, 158) to (53, 91).
; PLAN: r0=292(x), r1=172(y), r2=81(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=158(y1), r7=53(x2), r8=91(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 292
LDI r1, 172
LDI r2, 81
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 158
LDI r7, 53
LDI r8, 91
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
