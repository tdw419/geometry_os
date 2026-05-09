; DESCRIPTION: Composite: Draws a magenta circle centered at (335, 120) with radius 53 then Renders a orange line between points (56, 251) and (79, 92) then Places a purple dot at position (193, 76).
; PLAN: r0=335(x), r1=120(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x1), r6=251(y1), r7=79(x2), r8=92(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=193(x), r11=76(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 120
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 251
LDI r7, 79
LDI r8, 92
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 193
LDI r11, 76
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
