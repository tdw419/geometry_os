; DESCRIPTION: Composite: Draws a yellow line from (117, 189) to (143, 217) then Renders a black disk with center (287, 91) and radius 57.
; PLAN: r0=117(x1), r1=189(y1), r2=143(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=91(y), r7=57(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 117
LDI r1, 189
LDI r2, 143
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 91
LDI r7, 57
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
