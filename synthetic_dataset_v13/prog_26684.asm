; DESCRIPTION: Composite: Draws a orange line from (373, 150) to (190, 114) then Renders a magenta disk with center (287, 76) and radius 51 then Places a purple dot at position (500, 86).
; PLAN: r0=373(x1), r1=150(y1), r2=190(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=76(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=500(x), r11=86(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 373
LDI r1, 150
LDI r2, 190
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 76
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 500
LDI r11, 86
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
