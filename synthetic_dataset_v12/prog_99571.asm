; DESCRIPTION: Composite: Places a blue line segment connecting (146, 170) to (58, 113) then Places a orange 75x114 rectangle at position (45, 76).
; PLAN: r0=146(x1), r1=170(y1), r2=58(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=76(y), r7=75(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 170
LDI r2, 58
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 76
LDI r7, 75
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
