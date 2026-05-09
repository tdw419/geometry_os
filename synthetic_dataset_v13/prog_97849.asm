; DESCRIPTION: Composite: Draws a blue circle centered at (140, 64) with radius 47 then Renders a blue line between points (44, 116) and (73, 63).
; PLAN: r0=140(x), r1=64(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x1), r6=116(y1), r7=73(x2), r8=63(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 140
LDI r1, 64
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 116
LDI r7, 73
LDI r8, 63
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
