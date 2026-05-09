; DESCRIPTION: Composite: Renders a blue line between points (474, 131) and (92, 178) then Places a red circle of radius 11 at center (146, 203).
; PLAN: r0=474(x1), r1=131(y1), r2=92(x2), r3=178(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=203(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 474
LDI r1, 131
LDI r2, 92
LDI r3, 178
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 203
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
