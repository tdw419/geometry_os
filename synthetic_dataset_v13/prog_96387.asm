; DESCRIPTION: Composite: Renders a purple line between points (245, 223) and (197, 2) then Draws a black circle centered at (134, 173) with radius 55 then Sets a single magenta pixel at (50, 247).
; PLAN: r0=245(x1), r1=223(y1), r2=197(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=173(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x), r11=247(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 223
LDI r2, 197
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 173
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 247
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
