; DESCRIPTION: Composite: Renders a white box of size 19x108 starting at (427, 38) then Places a cyan line segment connecting (102, 208) to (442, 162).
; PLAN: r0=427(x), r1=38(y), r2=19(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=208(y1), r7=442(x2), r8=162(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 38
LDI r2, 19
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 208
LDI r7, 442
LDI r8, 162
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
