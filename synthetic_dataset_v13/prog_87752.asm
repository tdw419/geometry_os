; DESCRIPTION: Composite: Draws a yellow line from (358, 54) to (1, 3) then Places a magenta circle of radius 19 at center (109, 94).
; PLAN: r0=358(x1), r1=54(y1), r2=1(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=109(x), r6=94(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 54
LDI r2, 1
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 94
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
