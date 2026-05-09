; DESCRIPTION: Composite: Draws a green line from (293, 147) to (132, 226) then Places a green circle of radius 32 at center (247, 203).
; PLAN: r0=293(x1), r1=147(y1), r2=132(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=247(x), r6=203(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 147
LDI r2, 132
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 203
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
