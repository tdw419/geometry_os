; DESCRIPTION: Composite: Renders a blue line between points (482, 54) and (61, 75) then Renders a green disk with center (148, 179) and radius 16.
; PLAN: r0=482(x1), r1=54(y1), r2=61(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=179(y), r7=16(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 54
LDI r2, 61
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 179
LDI r7, 16
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
