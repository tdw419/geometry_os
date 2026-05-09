; DESCRIPTION: Composite: Places a black circle of radius 24 at center (60, 176) then Draws a black line from (424, 96) to (331, 136).
; PLAN: r0=60(x), r1=176(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x1), r6=96(y1), r7=331(x2), r8=136(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 176
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 96
LDI r7, 331
LDI r8, 136
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
