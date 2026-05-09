; DESCRIPTION: Composite: Places a magenta 80x28 rectangle at position (249, 18) then Places a magenta line segment connecting (321, 117) to (158, 116).
; PLAN: r0=249(x), r1=18(y), r2=80(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=117(y1), r7=158(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 18
LDI r2, 80
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 117
LDI r7, 158
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
