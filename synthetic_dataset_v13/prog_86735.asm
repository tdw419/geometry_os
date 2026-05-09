; DESCRIPTION: Composite: Draws a red rectangle at (332, 193) with width 108 and height 48 then Sets a single green pixel at (234, 24).
; PLAN: r0=332(x), r1=193(y), r2=108(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=234(x), r6=24(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 332
LDI r1, 193
LDI r2, 108
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 24
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
