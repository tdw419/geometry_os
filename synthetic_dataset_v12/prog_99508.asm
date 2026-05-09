; DESCRIPTION: Composite: Places a red circle of radius 76 at center (326, 157) then Draws a blue line from (326, 99) to (8, 74) then Sets a single green pixel at (395, 217).
; PLAN: r0=326(x), r1=157(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x1), r6=99(y1), r7=8(x2), r8=74(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=217(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 157
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 99
LDI r7, 8
LDI r8, 74
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 217
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
