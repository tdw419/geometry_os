; DESCRIPTION: Composite: Places a cyan 60x85 rectangle at position (174, 95) then Draws a magenta line from (62, 41) to (238, 53).
; PLAN: r0=174(x), r1=95(y), r2=60(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x1), r6=41(y1), r7=238(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 95
LDI r2, 60
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 41
LDI r7, 238
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
