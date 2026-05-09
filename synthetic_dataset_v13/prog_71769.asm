; DESCRIPTION: Composite: Draws a red line from (113, 184) to (130, 170) then Creates a purple circular shape at (228, 128) with radius 66.
; PLAN: r0=113(x1), r1=184(y1), r2=130(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=128(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 113
LDI r1, 184
LDI r2, 130
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 128
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
