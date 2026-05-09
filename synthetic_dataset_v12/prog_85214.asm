; DESCRIPTION: Composite: Draws a yellow line from (211, 80) to (412, 159) then Places a black circle of radius 31 at center (196, 186).
; PLAN: r0=211(x1), r1=80(y1), r2=412(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=186(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 211
LDI r1, 80
LDI r2, 412
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 186
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
