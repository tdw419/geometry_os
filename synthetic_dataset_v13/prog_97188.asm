; DESCRIPTION: Composite: Creates a purple circular shape at (270, 52) with radius 37 then Draws a magenta line from (426, 16) to (486, 180).
; PLAN: r0=270(x), r1=52(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=426(x1), r6=16(y1), r7=486(x2), r8=180(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 52
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 426
LDI r6, 16
LDI r7, 486
LDI r8, 180
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
