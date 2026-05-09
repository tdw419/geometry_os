; DESCRIPTION: Composite: Renders a green line between points (103, 5) and (140, 237) then Creates a green circular shape at (347, 146) with radius 57.
; PLAN: r0=103(x1), r1=5(y1), r2=140(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=146(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 103
LDI r1, 5
LDI r2, 140
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 146
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
