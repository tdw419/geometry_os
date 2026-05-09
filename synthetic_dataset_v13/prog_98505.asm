; DESCRIPTION: Composite: Places a magenta 36x53 rectangle at position (413, 112) then Renders a orange line between points (33, 160) and (459, 12).
; PLAN: r0=413(x), r1=112(y), r2=36(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=33(x1), r6=160(y1), r7=459(x2), r8=12(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 112
LDI r2, 36
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 160
LDI r7, 459
LDI r8, 12
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
