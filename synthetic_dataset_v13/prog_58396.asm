; DESCRIPTION: Composite: Renders a black line between points (493, 106) and (337, 225) then Renders a blue disk with center (440, 128) and radius 72.
; PLAN: r0=493(x1), r1=106(y1), r2=337(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=128(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 106
LDI r2, 337
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 128
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
