; DESCRIPTION: Composite: Renders a red line between points (245, 157) and (34, 140) then Places a green circle of radius 56 at center (288, 163).
; PLAN: r0=245(x1), r1=157(y1), r2=34(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=163(y), r7=56(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 157
LDI r2, 34
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 163
LDI r7, 56
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
