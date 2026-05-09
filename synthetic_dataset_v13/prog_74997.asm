; DESCRIPTION: Composite: Draws a magenta circle centered at (400, 81) with radius 80 then Draws a yellow line from (358, 107) to (124, 142).
; PLAN: r0=400(x), r1=81(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x1), r6=107(y1), r7=124(x2), r8=142(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 81
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 107
LDI r7, 124
LDI r8, 142
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
