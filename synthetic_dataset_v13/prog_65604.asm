; DESCRIPTION: Composite: Places a black circle of radius 20 at center (389, 195) then Draws a green line from (104, 70) to (506, 226).
; PLAN: r0=389(x), r1=195(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=70(y1), r7=506(x2), r8=226(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 195
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 70
LDI r7, 506
LDI r8, 226
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
