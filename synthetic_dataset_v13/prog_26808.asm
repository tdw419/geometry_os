; DESCRIPTION: Composite: Places a red line segment connecting (186, 45) to (74, 127) then Renders a red disk with center (232, 59) and radius 52.
; PLAN: r0=186(x1), r1=45(y1), r2=74(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=59(y), r7=52(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 45
LDI r2, 74
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 59
LDI r7, 52
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
