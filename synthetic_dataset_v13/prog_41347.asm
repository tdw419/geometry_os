; DESCRIPTION: Composite: Creates a purple rectangular region at (279, 1) spanning 62 by 87 pixels then Places a white line segment connecting (350, 101) to (184, 243).
; PLAN: r0=279(x), r1=1(y), r2=62(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=101(y1), r7=184(x2), r8=243(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 1
LDI r2, 62
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 101
LDI r7, 184
LDI r8, 243
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
