; DESCRIPTION: Composite: Draws a magenta circle centered at (276, 51) with radius 41 then Renders a black line between points (51, 4) and (228, 196).
; PLAN: r0=276(x), r1=51(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x1), r6=4(y1), r7=228(x2), r8=196(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 51
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 4
LDI r7, 228
LDI r8, 196
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
