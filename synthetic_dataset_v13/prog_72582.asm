; DESCRIPTION: Composite: Renders a white line between points (447, 52) and (268, 197) then Places a magenta dot at position (359, 211).
; PLAN: r0=447(x1), r1=52(y1), r2=268(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=211(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 447
LDI r1, 52
LDI r2, 268
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 211
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
