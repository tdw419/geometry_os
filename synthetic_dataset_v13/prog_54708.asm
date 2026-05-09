; DESCRIPTION: Composite: Places a purple circle of radius 55 at center (106, 92) then Draws a red line from (219, 61) to (383, 222).
; PLAN: r0=106(x), r1=92(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x1), r6=61(y1), r7=383(x2), r8=222(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 92
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 61
LDI r7, 383
LDI r8, 222
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
