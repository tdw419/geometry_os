; DESCRIPTION: Composite: Draws a white rectangle at (26, 42) with width 48 and height 30 then Draws a magenta line from (184, 106) to (123, 133).
; PLAN: r0=26(x), r1=42(y), r2=48(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=106(y1), r7=123(x2), r8=133(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 42
LDI r2, 48
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 106
LDI r7, 123
LDI r8, 133
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
