; DESCRIPTION: Composite: Draws a black line from (120, 199) to (509, 90) then Places a cyan dot at position (251, 27).
; PLAN: r0=120(x1), r1=199(y1), r2=509(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=27(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 199
LDI r2, 509
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 27
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
