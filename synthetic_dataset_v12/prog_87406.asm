; DESCRIPTION: Composite: Renders a orange line between points (94, 223) and (20, 185) then Places a orange 81x57 rectangle at position (308, 69).
; PLAN: r0=94(x1), r1=223(y1), r2=20(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=69(y), r7=81(width), r8=57(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 94
LDI r1, 223
LDI r2, 20
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 69
LDI r7, 81
LDI r8, 57
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
