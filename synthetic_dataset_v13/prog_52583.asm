; DESCRIPTION: Composite: Places a purple line segment connecting (500, 88) to (199, 179) then Places a white 14x39 rectangle at position (428, 190).
; PLAN: r0=500(x1), r1=88(y1), r2=199(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=428(x), r6=190(y), r7=14(width), r8=39(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 500
LDI r1, 88
LDI r2, 199
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 190
LDI r7, 14
LDI r8, 39
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
