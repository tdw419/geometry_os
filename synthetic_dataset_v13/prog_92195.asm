; DESCRIPTION: Composite: Renders a blue line between points (70, 239) and (406, 241) then Creates a red circular shape at (369, 147) with radius 64.
; PLAN: r0=70(x1), r1=239(y1), r2=406(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=369(x), r6=147(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 70
LDI r1, 239
LDI r2, 406
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 369
LDI r6, 147
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
