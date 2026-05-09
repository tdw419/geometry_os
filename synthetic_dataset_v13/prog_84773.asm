; DESCRIPTION: Composite: Renders a orange line between points (37, 70) and (376, 32) then Sets a single magenta pixel at (265, 128).
; PLAN: r0=37(x1), r1=70(y1), r2=376(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=128(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 37
LDI r1, 70
LDI r2, 376
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 128
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
