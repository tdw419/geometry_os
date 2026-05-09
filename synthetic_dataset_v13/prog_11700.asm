; DESCRIPTION: Composite: Places a green circle of radius 14 at center (142, 231) then Draws a white line from (348, 128) to (301, 122).
; PLAN: r0=142(x), r1=231(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x1), r6=128(y1), r7=301(x2), r8=122(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 231
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 128
LDI r7, 301
LDI r8, 122
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
