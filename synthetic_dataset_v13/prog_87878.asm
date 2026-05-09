; DESCRIPTION: Composite: Renders a orange line between points (298, 166) and (161, 81) then Sets a single red pixel at (441, 10) then Draws a magenta circle centered at (50, 56) with radius 44.
; PLAN: r0=298(x1), r1=166(y1), r2=161(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=441(x), r6=10(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=50(x), r11=56(y), r12=44(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 166
LDI r2, 161
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 441
LDI r6, 10
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 50
LDI r11, 56
LDI r12, 44
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
