; DESCRIPTION: Composite: Renders a black line between points (78, 105) and (193, 44) then Places a magenta circle of radius 38 at center (456, 125).
; PLAN: r0=78(x1), r1=105(y1), r2=193(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=456(x), r6=125(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 105
LDI r2, 193
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 125
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
