; DESCRIPTION: Composite: Draws a green line from (89, 166) to (192, 24) then Places a black circle of radius 72 at center (160, 106).
; PLAN: r0=89(x1), r1=166(y1), r2=192(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=106(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 89
LDI r1, 166
LDI r2, 192
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 106
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
