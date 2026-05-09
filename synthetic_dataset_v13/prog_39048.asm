; DESCRIPTION: Composite: Renders a yellow line between points (243, 218) and (403, 148) then Draws a red circle centered at (328, 94) with radius 74.
; PLAN: r0=243(x1), r1=218(y1), r2=403(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=328(x), r6=94(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 218
LDI r2, 403
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 94
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
