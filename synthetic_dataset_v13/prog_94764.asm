; DESCRIPTION: Composite: Draws a cyan rectangle at (201, 9) with width 14 and height 85 then Sets a single black pixel at (385, 227).
; PLAN: r0=201(x), r1=9(y), r2=14(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=227(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 201
LDI r1, 9
LDI r2, 14
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 227
LDI r7, 0x000000
PSET r5, r6, r7
HALT
