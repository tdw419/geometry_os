; DESCRIPTION: Composite: Places a yellow line segment connecting (407, 90) to (179, 32) then Renders a green box of size 34x69 starting at (175, 38).
; PLAN: r0=407(x1), r1=90(y1), r2=179(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=38(y), r7=34(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 407
LDI r1, 90
LDI r2, 179
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 38
LDI r7, 34
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
