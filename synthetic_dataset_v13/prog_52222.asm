; DESCRIPTION: Composite: Renders a green line between points (274, 179) and (23, 68) then Places a green 26x76 rectangle at position (76, 90).
; PLAN: r0=274(x1), r1=179(y1), r2=23(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=76(x), r6=90(y), r7=26(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 179
LDI r2, 23
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 90
LDI r7, 26
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
