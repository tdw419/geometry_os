; DESCRIPTION: Composite: Renders a yellow line between points (429, 217) and (280, 157) then Sets a single red pixel at (199, 36) then Places a magenta circle of radius 60 at center (315, 82).
; PLAN: r0=429(x1), r1=217(y1), r2=280(x2), r3=157(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=36(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=315(x), r11=82(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 217
LDI r2, 280
LDI r3, 157
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 36
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 315
LDI r11, 82
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
