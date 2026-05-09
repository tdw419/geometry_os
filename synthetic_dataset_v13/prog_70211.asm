; DESCRIPTION: Composite: Places a red circle of radius 44 at center (84, 103) then Draws a red line from (433, 16) to (26, 237).
; PLAN: r0=84(x), r1=103(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=16(y1), r7=26(x2), r8=237(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 84
LDI r1, 103
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 16
LDI r7, 26
LDI r8, 237
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
