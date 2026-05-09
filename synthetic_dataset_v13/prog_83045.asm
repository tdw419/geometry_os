; DESCRIPTION: Composite: Draws a white circle centered at (216, 221) with radius 25 then Renders a yellow line between points (314, 15) and (69, 59).
; PLAN: r0=216(x), r1=221(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=15(y1), r7=69(x2), r8=59(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 216
LDI r1, 221
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 15
LDI r7, 69
LDI r8, 59
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
