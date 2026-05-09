; DESCRIPTION: Composite: Renders a magenta line between points (445, 82) and (402, 124) then Sets a single white pixel at (14, 51).
; PLAN: r0=445(x1), r1=82(y1), r2=402(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=51(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 445
LDI r1, 82
LDI r2, 402
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 51
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
