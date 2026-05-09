; DESCRIPTION: Composite: Draws a red line from (481, 71) to (378, 83) then Sets a single white pixel at (164, 103).
; PLAN: r0=481(x1), r1=71(y1), r2=378(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=103(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 481
LDI r1, 71
LDI r2, 378
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 103
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
