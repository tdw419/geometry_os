; DESCRIPTION: Composite: Places a red 112x49 rectangle at position (106, 136) then Places a orange line segment connecting (354, 90) to (45, 225).
; PLAN: r0=106(x), r1=136(y), r2=112(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=354(x1), r6=90(y1), r7=45(x2), r8=225(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 136
LDI r2, 112
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 90
LDI r7, 45
LDI r8, 225
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
