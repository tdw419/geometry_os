; DESCRIPTION: Composite: Draws a orange line from (245, 197) to (111, 81) then Places a green dot at position (426, 251).
; PLAN: r0=245(x1), r1=197(y1), r2=111(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=251(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 197
LDI r2, 111
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 251
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
