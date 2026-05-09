; DESCRIPTION: Composite: Creates a yellow circular shape at (232, 180) with radius 36 then Draws a white line from (279, 56) to (213, 181).
; PLAN: r0=232(x), r1=180(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x1), r6=56(y1), r7=213(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 180
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 56
LDI r7, 213
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
