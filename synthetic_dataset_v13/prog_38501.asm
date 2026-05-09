; DESCRIPTION: Composite: Sets a single orange pixel at (295, 181) then Draws a black line from (269, 251) to (257, 85).
; PLAN: r0=295(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=269(x1), r6=251(y1), r7=257(x2), r8=85(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 295
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 269
LDI r6, 251
LDI r7, 257
LDI r8, 85
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
