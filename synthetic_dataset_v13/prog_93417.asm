; DESCRIPTION: Composite: Places a yellow line segment connecting (454, 255) to (491, 82) then Sets a single magenta pixel at (340, 77).
; PLAN: r0=454(x1), r1=255(y1), r2=491(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=77(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 255
LDI r2, 491
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 77
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
