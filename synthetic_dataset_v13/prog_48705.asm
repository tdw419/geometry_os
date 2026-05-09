; DESCRIPTION: Composite: Renders a green line between points (173, 124) and (59, 122) then Draws a yellow circle centered at (296, 174) with radius 52.
; PLAN: r0=173(x1), r1=124(y1), r2=59(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=174(y), r7=52(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 124
LDI r2, 59
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 174
LDI r7, 52
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
