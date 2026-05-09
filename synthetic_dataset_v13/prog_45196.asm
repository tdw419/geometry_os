; DESCRIPTION: Composite: Renders a black line between points (180, 48) and (263, 95) then Renders a green disk with center (318, 139) and radius 44.
; PLAN: r0=180(x1), r1=48(y1), r2=263(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=139(y), r7=44(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 180
LDI r1, 48
LDI r2, 263
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 139
LDI r7, 44
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
