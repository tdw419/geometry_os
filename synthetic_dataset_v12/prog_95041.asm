; DESCRIPTION: Composite: Draws a red rectangle at (178, 71) with width 78 and height 83 then Sets a single cyan pixel at (299, 210).
; PLAN: r0=178(x), r1=71(y), r2=78(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=210(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 178
LDI r1, 71
LDI r2, 78
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 210
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
