; DESCRIPTION: Composite: Draws a black line from (78, 179) to (287, 130) then Places a cyan dot at position (253, 39).
; PLAN: r0=78(x1), r1=179(y1), r2=287(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=39(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 78
LDI r1, 179
LDI r2, 287
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 39
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
