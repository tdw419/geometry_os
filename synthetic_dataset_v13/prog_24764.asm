; DESCRIPTION: Composite: Renders a red line between points (69, 45) and (361, 1) then Places a magenta dot at position (185, 64).
; PLAN: r0=69(x1), r1=45(y1), r2=361(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=185(x), r6=64(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 69
LDI r1, 45
LDI r2, 361
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 64
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
