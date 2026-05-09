; DESCRIPTION: Composite: Renders a red line between points (387, 34) and (350, 19) then Renders a blue disk with center (341, 79) and radius 16.
; PLAN: r0=387(x1), r1=34(y1), r2=350(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=341(x), r6=79(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 387
LDI r1, 34
LDI r2, 350
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 79
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
