; DESCRIPTION: Composite: Renders a red box of size 76x114 starting at (229, 26) then Places a blue line segment connecting (492, 55) to (469, 99).
; PLAN: r0=229(x), r1=26(y), r2=76(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=55(y1), r7=469(x2), r8=99(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 26
LDI r2, 76
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 55
LDI r7, 469
LDI r8, 99
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
