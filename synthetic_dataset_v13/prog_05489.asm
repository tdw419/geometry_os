; DESCRIPTION: Composite: Draws a green circle centered at (189, 108) with radius 14 then Renders a blue line between points (307, 240) and (301, 176).
; PLAN: r0=189(x), r1=108(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=240(y1), r7=301(x2), r8=176(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 189
LDI r1, 108
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 240
LDI r7, 301
LDI r8, 176
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
