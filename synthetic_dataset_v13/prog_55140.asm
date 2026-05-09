; DESCRIPTION: Composite: Renders a black box of size 24x58 starting at (272, 76) then Sets a single yellow pixel at (188, 60).
; PLAN: r0=272(x), r1=76(y), r2=24(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=60(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 76
LDI r2, 24
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 60
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
