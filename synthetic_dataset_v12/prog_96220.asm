; DESCRIPTION: Composite: Draws a yellow rectangle at (339, 189) with width 115 and height 47 then Sets a single orange pixel at (446, 189).
; PLAN: r0=339(x), r1=189(y), r2=115(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=189(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 189
LDI r2, 115
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 189
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
