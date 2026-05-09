; DESCRIPTION: Composite: Places a orange line segment connecting (334, 33) to (29, 200) then Sets a single yellow pixel at (258, 102) then Renders a orange box of size 50x113 starting at (393, 14).
; PLAN: r0=334(x1), r1=33(y1), r2=29(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=102(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=393(x), r11=14(y), r12=50(width), r13=113(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 33
LDI r2, 29
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 102
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 393
LDI r11, 14
LDI r12, 50
LDI r13, 113
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
