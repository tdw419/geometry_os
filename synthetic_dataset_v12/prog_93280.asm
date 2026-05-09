; DESCRIPTION: Composite: Draws a black circle centered at (189, 205) with radius 32 then Renders a blue line between points (301, 252) and (210, 199).
; PLAN: r0=189(x), r1=205(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=301(x1), r6=252(y1), r7=210(x2), r8=199(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 205
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 301
LDI r6, 252
LDI r7, 210
LDI r8, 199
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
