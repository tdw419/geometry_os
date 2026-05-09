; DESCRIPTION: Composite: Places a black circle of radius 26 at center (377, 160) then Draws a blue line from (23, 170) to (240, 140).
; PLAN: r0=377(x), r1=160(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x1), r6=170(y1), r7=240(x2), r8=140(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 377
LDI r1, 160
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 170
LDI r7, 240
LDI r8, 140
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
