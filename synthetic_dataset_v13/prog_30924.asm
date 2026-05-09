; DESCRIPTION: Composite: Places a green 100x102 rectangle at position (338, 75) then Places a green line segment connecting (223, 208) to (181, 156).
; PLAN: r0=338(x), r1=75(y), r2=100(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=223(x1), r6=208(y1), r7=181(x2), r8=156(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 338
LDI r1, 75
LDI r2, 100
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 208
LDI r7, 181
LDI r8, 156
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
