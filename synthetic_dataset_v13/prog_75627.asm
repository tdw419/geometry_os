; DESCRIPTION: Composite: Places a green 58x41 rectangle at position (304, 150) then Places a black line segment connecting (131, 35) to (378, 183).
; PLAN: r0=304(x), r1=150(y), r2=58(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=35(y1), r7=378(x2), r8=183(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 150
LDI r2, 58
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 35
LDI r7, 378
LDI r8, 183
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
