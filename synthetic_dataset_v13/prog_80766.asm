; DESCRIPTION: Composite: Renders a green box of size 101x13 starting at (153, 82) then Places a purple line segment connecting (9, 53) to (134, 35).
; PLAN: r0=153(x), r1=82(y), r2=101(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=9(x1), r6=53(y1), r7=134(x2), r8=35(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 82
LDI r2, 101
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 9
LDI r6, 53
LDI r7, 134
LDI r8, 35
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
