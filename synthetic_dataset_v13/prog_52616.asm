; DESCRIPTION: Composite: Places a red 60x39 rectangle at position (452, 85) then Places a magenta line segment connecting (18, 226) to (321, 82).
; PLAN: r0=452(x), r1=85(y), r2=60(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=18(x1), r6=226(y1), r7=321(x2), r8=82(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 452
LDI r1, 85
LDI r2, 60
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 226
LDI r7, 321
LDI r8, 82
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
