; DESCRIPTION: Composite: Renders a blue line between points (142, 4) and (215, 51) then Sets a single orange pixel at (401, 89).
; PLAN: r0=142(x1), r1=4(y1), r2=215(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=89(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 142
LDI r1, 4
LDI r2, 215
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 89
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
