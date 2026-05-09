; DESCRIPTION: Composite: Draws a blue line from (231, 163) to (47, 83) then Creates a magenta circular shape at (65, 167) with radius 40.
; PLAN: r0=231(x1), r1=163(y1), r2=47(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=167(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 163
LDI r2, 47
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 167
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
