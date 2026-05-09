; DESCRIPTION: Composite: Places a purple line segment connecting (99, 7) to (202, 175) then Renders a yellow box of size 96x102 starting at (297, 25).
; PLAN: r0=99(x1), r1=7(y1), r2=202(x2), r3=175(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=25(y), r7=96(width), r8=102(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 7
LDI r2, 202
LDI r3, 175
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 25
LDI r7, 96
LDI r8, 102
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
