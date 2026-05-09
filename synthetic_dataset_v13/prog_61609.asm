; DESCRIPTION: Composite: Renders a black disk with center (311, 74) and radius 74 then Draws a blue line from (59, 243) to (206, 44).
; PLAN: r0=311(x), r1=74(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=243(y1), r7=206(x2), r8=44(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 311
LDI r1, 74
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 243
LDI r7, 206
LDI r8, 44
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
