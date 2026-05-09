; DESCRIPTION: Composite: Renders a white disk with center (371, 122) and radius 78 then Draws a red line from (30, 113) to (232, 186).
; PLAN: r0=371(x), r1=122(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=113(y1), r7=232(x2), r8=186(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 122
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 113
LDI r7, 232
LDI r8, 186
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
