; DESCRIPTION: Composite: Draws a blue circle centered at (405, 115) with radius 78 then Renders a blue line between points (305, 221) and (232, 141).
; PLAN: r0=405(x), r1=115(y), r2=78(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=221(y1), r7=232(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 115
LDI r2, 78
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 221
LDI r7, 232
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
