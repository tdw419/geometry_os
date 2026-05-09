; DESCRIPTION: Composite: Draws a black line from (32, 180) to (391, 37) then Places a purple dot at position (509, 22).
; PLAN: r0=32(x1), r1=180(y1), r2=391(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=509(x), r6=22(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 32
LDI r1, 180
LDI r2, 391
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 22
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
