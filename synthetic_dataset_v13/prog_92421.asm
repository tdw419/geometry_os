; DESCRIPTION: Composite: Places a orange circle of radius 67 at center (293, 82) then Renders a blue line between points (174, 69) and (336, 254) then Sets a single purple pixel at (279, 70).
; PLAN: r0=293(x), r1=82(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=174(x1), r6=69(y1), r7=336(x2), r8=254(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=279(x), r11=70(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 82
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 174
LDI r6, 69
LDI r7, 336
LDI r8, 254
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 279
LDI r11, 70
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
