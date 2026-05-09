; DESCRIPTION: Composite: Places a magenta 33x24 rectangle at position (168, 158) then Places a orange line segment connecting (497, 31) to (434, 196).
; PLAN: r0=168(x), r1=158(y), r2=33(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=497(x1), r6=31(y1), r7=434(x2), r8=196(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 168
LDI r1, 158
LDI r2, 33
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 497
LDI r6, 31
LDI r7, 434
LDI r8, 196
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
