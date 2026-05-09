; DESCRIPTION: Composite: Draws a green line from (63, 57) to (312, 226) then Places a red circle of radius 74 at center (348, 142).
; PLAN: r0=63(x1), r1=57(y1), r2=312(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=142(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 63
LDI r1, 57
LDI r2, 312
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 142
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
