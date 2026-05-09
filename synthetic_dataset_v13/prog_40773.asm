; DESCRIPTION: Composite: Places a yellow line segment connecting (278, 20) to (202, 84) then Renders a red disk with center (433, 90) and radius 55.
; PLAN: r0=278(x1), r1=20(y1), r2=202(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=90(y), r7=55(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 278
LDI r1, 20
LDI r2, 202
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 90
LDI r7, 55
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
