; DESCRIPTION: Composite: Creates a blue circular shape at (397, 198) with radius 43 then Places a red line segment connecting (322, 206) to (395, 118).
; PLAN: r0=397(x), r1=198(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=322(x1), r6=206(y1), r7=395(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 198
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 322
LDI r6, 206
LDI r7, 395
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
