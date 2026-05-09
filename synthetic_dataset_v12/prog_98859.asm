; DESCRIPTION: Composite: Renders a white line between points (133, 220) and (116, 79) then Sets a single purple pixel at (277, 194).
; PLAN: r0=133(x1), r1=220(y1), r2=116(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=194(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 220
LDI r2, 116
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 194
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
