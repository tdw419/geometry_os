; DESCRIPTION: Composite: Renders a blue line between points (423, 174) and (277, 202) then Draws a red circle centered at (74, 127) with radius 44.
; PLAN: r0=423(x1), r1=174(y1), r2=277(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=74(x), r6=127(y), r7=44(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 174
LDI r2, 277
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 127
LDI r7, 44
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
