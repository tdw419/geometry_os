; DESCRIPTION: Composite: Renders a purple line between points (325, 200) and (88, 193) then Renders a yellow box of size 48x17 starting at (23, 187).
; PLAN: r0=325(x1), r1=200(y1), r2=88(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=187(y), r7=48(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 325
LDI r1, 200
LDI r2, 88
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 187
LDI r7, 48
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
