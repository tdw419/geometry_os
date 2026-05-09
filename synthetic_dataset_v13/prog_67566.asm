; DESCRIPTION: Composite: Sets a single white pixel at (397, 11) then Renders a yellow line between points (362, 131) and (325, 195).
; PLAN: r0=397(x), r1=11(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=362(x1), r6=131(y1), r7=325(x2), r8=195(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 11
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 362
LDI r6, 131
LDI r7, 325
LDI r8, 195
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
