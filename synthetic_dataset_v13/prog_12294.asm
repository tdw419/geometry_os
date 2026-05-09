; DESCRIPTION: Composite: Draws a blue line from (461, 73) to (296, 66) then Places a red circle of radius 74 at center (175, 123).
; PLAN: r0=461(x1), r1=73(y1), r2=296(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=123(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 73
LDI r2, 296
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 123
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
