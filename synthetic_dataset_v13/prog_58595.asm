; DESCRIPTION: Composite: Renders a red line between points (194, 1) and (436, 53) then Places a magenta dot at position (18, 128).
; PLAN: r0=194(x1), r1=1(y1), r2=436(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=18(x), r6=128(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 1
LDI r2, 436
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 18
LDI r6, 128
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
