; DESCRIPTION: Composite: Draws a red line from (289, 161) to (410, 218) then Sets a single white pixel at (237, 85).
; PLAN: r0=289(x1), r1=161(y1), r2=410(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=85(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 161
LDI r2, 410
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 85
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
