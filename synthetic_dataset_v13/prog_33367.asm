; DESCRIPTION: Composite: Draws a black line from (311, 179) to (437, 225) then Places a magenta dot at position (388, 242).
; PLAN: r0=311(x1), r1=179(y1), r2=437(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=242(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 179
LDI r2, 437
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 242
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
