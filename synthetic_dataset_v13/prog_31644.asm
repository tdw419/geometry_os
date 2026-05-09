; DESCRIPTION: Composite: Renders a magenta line between points (369, 210) and (92, 99) then Renders a white disk with center (238, 125) and radius 74.
; PLAN: r0=369(x1), r1=210(y1), r2=92(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=238(x), r6=125(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 369
LDI r1, 210
LDI r2, 92
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 125
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
