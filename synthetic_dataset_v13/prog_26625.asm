; DESCRIPTION: Composite: Places a magenta line segment connecting (254, 172) to (374, 250) then Places a red 98x30 rectangle at position (225, 30).
; PLAN: r0=254(x1), r1=172(y1), r2=374(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=225(x), r6=30(y), r7=98(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 254
LDI r1, 172
LDI r2, 374
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 30
LDI r7, 98
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
