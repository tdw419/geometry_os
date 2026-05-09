; DESCRIPTION: Composite: Draws a yellow line from (90, 218) to (256, 219) then Sets a single black pixel at (6, 166).
; PLAN: r0=90(x1), r1=218(y1), r2=256(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=166(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 90
LDI r1, 218
LDI r2, 256
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 166
LDI r7, 0x000000
PSET r5, r6, r7
HALT
