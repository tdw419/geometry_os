; DESCRIPTION: Composite: Renders a blue disk with center (264, 93) and radius 51 then Draws a blue line from (160, 144) to (80, 108).
; PLAN: r0=264(x), r1=93(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=144(y1), r7=80(x2), r8=108(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 93
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 144
LDI r7, 80
LDI r8, 108
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
