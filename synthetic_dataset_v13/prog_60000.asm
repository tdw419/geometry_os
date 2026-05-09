; DESCRIPTION: Composite: Places a red 67x10 rectangle at position (254, 82) then Renders a orange line between points (118, 251) and (156, 178).
; PLAN: r0=254(x), r1=82(y), r2=67(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=118(x1), r6=251(y1), r7=156(x2), r8=178(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 82
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 251
LDI r7, 156
LDI r8, 178
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
