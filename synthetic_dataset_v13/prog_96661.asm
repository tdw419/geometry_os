; DESCRIPTION: Composite: Places a purple line segment connecting (226, 19) to (97, 36) then Renders a yellow box of size 116x18 starting at (370, 160).
; PLAN: r0=226(x1), r1=19(y1), r2=97(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=160(y), r7=116(width), r8=18(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 19
LDI r2, 97
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 160
LDI r7, 116
LDI r8, 18
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
