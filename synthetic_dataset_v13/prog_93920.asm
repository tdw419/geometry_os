; DESCRIPTION: Composite: Draws a yellow circle centered at (141, 133) with radius 53 then Draws a red line from (230, 2) to (326, 8).
; PLAN: r0=141(x), r1=133(y), r2=53(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=230(x1), r6=2(y1), r7=326(x2), r8=8(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 133
LDI r2, 53
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 230
LDI r6, 2
LDI r7, 326
LDI r8, 8
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
