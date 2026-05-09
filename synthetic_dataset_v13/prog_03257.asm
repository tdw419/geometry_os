; DESCRIPTION: Composite: Places a red 61x97 rectangle at position (284, 139) then Places a yellow line segment connecting (492, 158) to (31, 42).
; PLAN: r0=284(x), r1=139(y), r2=61(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=158(y1), r7=31(x2), r8=42(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 139
LDI r2, 61
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 158
LDI r7, 31
LDI r8, 42
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
