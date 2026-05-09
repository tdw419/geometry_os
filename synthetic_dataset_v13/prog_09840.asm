; DESCRIPTION: Composite: Renders a blue line between points (122, 74) and (510, 51) then Renders a green disk with center (146, 112) and radius 74.
; PLAN: r0=122(x1), r1=74(y1), r2=510(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=112(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 74
LDI r2, 510
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 112
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
