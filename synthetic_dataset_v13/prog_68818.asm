; DESCRIPTION: Composite: Draws a black rectangle at (272, 68) with width 34 and height 103 then Sets a single orange pixel at (227, 79).
; PLAN: r0=272(x), r1=68(y), r2=34(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=79(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 68
LDI r2, 34
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 79
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
