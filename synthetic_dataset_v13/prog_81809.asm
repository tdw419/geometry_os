; DESCRIPTION: Composite: Places a yellow line segment connecting (119, 200) to (151, 114) then Places a orange 28x63 rectangle at position (134, 110).
; PLAN: r0=119(x1), r1=200(y1), r2=151(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=110(y), r7=28(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 200
LDI r2, 151
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 110
LDI r7, 28
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
