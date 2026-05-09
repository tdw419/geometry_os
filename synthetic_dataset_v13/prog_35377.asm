; DESCRIPTION: Composite: Places a green circle of radius 55 at center (179, 81) then Renders a blue line between points (180, 3) and (399, 73).
; PLAN: r0=179(x), r1=81(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=3(y1), r7=399(x2), r8=73(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 179
LDI r1, 81
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 3
LDI r7, 399
LDI r8, 73
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
