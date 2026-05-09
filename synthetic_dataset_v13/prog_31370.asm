; DESCRIPTION: Composite: Draws a black rectangle at (272, 13) with width 89 and height 119 then Sets a single white pixel at (465, 227).
; PLAN: r0=272(x), r1=13(y), r2=89(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x), r6=227(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 13
LDI r2, 89
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 227
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
