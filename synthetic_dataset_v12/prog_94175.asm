; DESCRIPTION: Composite: Draws a white line from (365, 158) to (146, 98) then Sets a single black pixel at (123, 200).
; PLAN: r0=365(x1), r1=158(y1), r2=146(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=200(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 158
LDI r2, 146
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 200
LDI r7, 0x000000
PSET r5, r6, r7
HALT
