; DESCRIPTION: Composite: Places a black line segment connecting (483, 137) to (407, 22) then Renders a yellow box of size 108x13 starting at (24, 117).
; PLAN: r0=483(x1), r1=137(y1), r2=407(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=24(x), r6=117(y), r7=108(width), r8=13(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 483
LDI r1, 137
LDI r2, 407
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 117
LDI r7, 108
LDI r8, 13
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
