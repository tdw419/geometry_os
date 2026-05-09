; DESCRIPTION: Composite: Renders a yellow line between points (502, 201) and (193, 92) then Draws a purple rectangle at (217, 90) with width 52 and height 44.
; PLAN: r0=502(x1), r1=201(y1), r2=193(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=217(x), r6=90(y), r7=52(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 201
LDI r2, 193
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 90
LDI r7, 52
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
