; DESCRIPTION: Composite: Draws a black line from (95, 244) to (437, 3) then Sets a single white pixel at (10, 82).
; PLAN: r0=95(x1), r1=244(y1), r2=437(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=82(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 244
LDI r2, 437
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 82
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
