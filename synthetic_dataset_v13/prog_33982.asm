; DESCRIPTION: Composite: Draws a yellow line from (419, 253) to (317, 254) then Sets a single black pixel at (410, 76).
; PLAN: r0=419(x1), r1=253(y1), r2=317(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=76(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 253
LDI r2, 317
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 76
LDI r7, 0x000000
PSET r5, r6, r7
HALT
