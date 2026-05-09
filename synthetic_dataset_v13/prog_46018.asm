; DESCRIPTION: Composite: Draws a purple circle centered at (107, 51) with radius 26 then Renders a green line between points (455, 189) and (372, 204).
; PLAN: r0=107(x), r1=51(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=189(y1), r7=372(x2), r8=204(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 51
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 189
LDI r7, 372
LDI r8, 204
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
