; DESCRIPTION: Composite: Renders a blue line between points (156, 183) and (409, 103) then Sets a single red pixel at (397, 198).
; PLAN: r0=156(x1), r1=183(y1), r2=409(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=198(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 156
LDI r1, 183
LDI r2, 409
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 198
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
