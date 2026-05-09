; DESCRIPTION: Composite: Places a magenta circle of radius 73 at center (259, 176) then Draws a black line from (415, 89) to (96, 244).
; PLAN: r0=259(x), r1=176(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=415(x1), r6=89(y1), r7=96(x2), r8=244(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 176
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 415
LDI r6, 89
LDI r7, 96
LDI r8, 244
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
