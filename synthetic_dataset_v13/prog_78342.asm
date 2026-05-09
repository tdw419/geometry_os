; DESCRIPTION: Composite: Renders a magenta disk with center (344, 134) and radius 44 then Renders a black line between points (349, 123) and (199, 27).
; PLAN: r0=344(x), r1=134(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x1), r6=123(y1), r7=199(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 134
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 123
LDI r7, 199
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
