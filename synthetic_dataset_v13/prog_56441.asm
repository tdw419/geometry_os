; DESCRIPTION: Composite: Renders a yellow box of size 94x111 starting at (300, 80) then Renders a purple line between points (197, 44) and (262, 89) then Renders a white disk with center (207, 89) and radius 56.
; PLAN: r0=300(x), r1=80(y), r2=94(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x1), r6=44(y1), r7=262(x2), r8=89(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=207(x), r11=89(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 300
LDI r1, 80
LDI r2, 94
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 44
LDI r7, 262
LDI r8, 89
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 89
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
