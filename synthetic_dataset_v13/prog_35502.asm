; DESCRIPTION: Composite: Places a green dot at position (419, 175) then Draws a black line from (461, 254) to (333, 62).
; PLAN: r0=419(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=461(x1), r6=254(y1), r7=333(x2), r8=62(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 461
LDI r6, 254
LDI r7, 333
LDI r8, 62
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
