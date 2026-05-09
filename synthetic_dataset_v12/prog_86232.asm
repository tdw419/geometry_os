; DESCRIPTION: Composite: Draws a magenta line from (492, 90) to (125, 38) then Draws a magenta circle centered at (60, 94) with radius 43.
; PLAN: r0=492(x1), r1=90(y1), r2=125(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=60(x), r6=94(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 492
LDI r1, 90
LDI r2, 125
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 94
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
