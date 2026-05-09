; DESCRIPTION: Composite: Places a red 25x11 rectangle at position (55, 116) then Places a green line segment connecting (311, 227) to (91, 112).
; PLAN: r0=55(x), r1=116(y), r2=25(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x1), r6=227(y1), r7=91(x2), r8=112(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 116
LDI r2, 25
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 227
LDI r7, 91
LDI r8, 112
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
