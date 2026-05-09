; DESCRIPTION: Composite: Draws a red rectangle at (466, 13) with width 34 and height 46 then Sets a single orange pixel at (27, 140).
; PLAN: r0=466(x), r1=13(y), r2=34(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=140(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 466
LDI r1, 13
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 140
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
