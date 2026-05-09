; DESCRIPTION: Composite: Draws a yellow line from (151, 159) to (127, 10) then Draws a orange circle centered at (297, 80) with radius 64.
; PLAN: r0=151(x1), r1=159(y1), r2=127(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=80(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 151
LDI r1, 159
LDI r2, 127
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 80
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
