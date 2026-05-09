; DESCRIPTION: Composite: Renders a magenta line between points (241, 157) and (171, 203) then Sets a single white pixel at (285, 124).
; PLAN: r0=241(x1), r1=157(y1), r2=171(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=124(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 157
LDI r2, 171
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 124
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
