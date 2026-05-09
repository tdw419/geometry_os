; DESCRIPTION: Composite: Renders a white line between points (401, 28) and (277, 14) then Sets a single red pixel at (134, 84).
; PLAN: r0=401(x1), r1=28(y1), r2=277(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=84(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 28
LDI r2, 277
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 84
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
