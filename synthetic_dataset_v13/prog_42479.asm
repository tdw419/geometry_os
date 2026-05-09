; DESCRIPTION: Composite: Places a purple line segment connecting (322, 70) to (100, 131) then Draws a white rectangle at (409, 62) with width 82 and height 87.
; PLAN: r0=322(x1), r1=70(y1), r2=100(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=62(y), r7=82(width), r8=87(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 322
LDI r1, 70
LDI r2, 100
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 62
LDI r7, 82
LDI r8, 87
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
