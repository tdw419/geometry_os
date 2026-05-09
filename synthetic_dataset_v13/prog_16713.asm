; DESCRIPTION: Composite: Places a red 11x74 rectangle at position (269, 126) then Places a black line segment connecting (232, 26) to (60, 20).
; PLAN: r0=269(x), r1=126(y), r2=11(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x1), r6=26(y1), r7=60(x2), r8=20(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 126
LDI r2, 11
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 26
LDI r7, 60
LDI r8, 20
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
