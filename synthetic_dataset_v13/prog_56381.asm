; DESCRIPTION: Composite: Places a purple circle of radius 16 at center (307, 80) then Draws a blue line from (456, 121) to (259, 250).
; PLAN: r0=307(x), r1=80(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x1), r6=121(y1), r7=259(x2), r8=250(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 80
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 121
LDI r7, 259
LDI r8, 250
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
