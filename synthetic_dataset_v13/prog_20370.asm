; DESCRIPTION: Composite: Places a black circle of radius 61 at center (296, 170) then Draws a blue line from (39, 146) to (439, 2).
; PLAN: r0=296(x), r1=170(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x1), r6=146(y1), r7=439(x2), r8=2(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 170
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 146
LDI r7, 439
LDI r8, 2
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
