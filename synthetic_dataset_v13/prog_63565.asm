; DESCRIPTION: Composite: Places a purple line segment connecting (124, 118) to (12, 230) then Renders a white box of size 116x54 starting at (210, 65).
; PLAN: r0=124(x1), r1=118(y1), r2=12(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=210(x), r6=65(y), r7=116(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 118
LDI r2, 12
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 65
LDI r7, 116
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
