; DESCRIPTION: Composite: Renders a blue line between points (238, 24) and (290, 238) then Places a blue circle of radius 14 at center (152, 169).
; PLAN: r0=238(x1), r1=24(y1), r2=290(x2), r3=238(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=169(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 238
LDI r1, 24
LDI r2, 290
LDI r3, 238
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 169
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
