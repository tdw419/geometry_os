; DESCRIPTION: Composite: Places a magenta 59x29 rectangle at position (334, 128) then Renders a red line between points (166, 227) and (195, 205).
; PLAN: r0=334(x), r1=128(y), r2=59(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x1), r6=227(y1), r7=195(x2), r8=205(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 128
LDI r2, 59
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 227
LDI r7, 195
LDI r8, 205
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
