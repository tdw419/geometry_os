; DESCRIPTION: Composite: Renders a yellow line between points (461, 187) and (361, 127) then Places a magenta circle of radius 10 at center (96, 55).
; PLAN: r0=461(x1), r1=187(y1), r2=361(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=55(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 461
LDI r1, 187
LDI r2, 361
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 55
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
