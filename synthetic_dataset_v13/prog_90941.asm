; DESCRIPTION: Composite: Renders a blue line between points (454, 100) and (305, 68) then Renders a blue disk with center (441, 165) and radius 68.
; PLAN: r0=454(x1), r1=100(y1), r2=305(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=165(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 100
LDI r2, 305
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 165
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
