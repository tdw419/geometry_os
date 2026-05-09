; DESCRIPTION: Composite: Places a orange 35x45 rectangle at position (134, 109) then Renders a red line between points (15, 42) and (125, 149).
; PLAN: r0=134(x), r1=109(y), r2=35(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x1), r6=42(y1), r7=125(x2), r8=149(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 109
LDI r2, 35
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 42
LDI r7, 125
LDI r8, 149
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
