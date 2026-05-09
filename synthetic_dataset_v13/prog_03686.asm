; DESCRIPTION: Composite: Renders a black line between points (61, 72) and (190, 243) then Places a orange circle of radius 35 at center (137, 211).
; PLAN: r0=61(x1), r1=72(y1), r2=190(x2), r3=243(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=211(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 72
LDI r2, 190
LDI r3, 243
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 211
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
