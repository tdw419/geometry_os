; DESCRIPTION: Composite: Draws a black line from (10, 240) to (5, 104) then Places a yellow dot at position (326, 250).
; PLAN: r0=10(x1), r1=240(y1), r2=5(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=250(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 10
LDI r1, 240
LDI r2, 5
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 250
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
