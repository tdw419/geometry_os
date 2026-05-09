; DESCRIPTION: Composite: Places a green line segment connecting (408, 91) to (341, 159) then Places a magenta circle of radius 80 at center (296, 143).
; PLAN: r0=408(x1), r1=91(y1), r2=341(x2), r3=159(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=143(y), r7=80(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 408
LDI r1, 91
LDI r2, 341
LDI r3, 159
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 143
LDI r7, 80
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
