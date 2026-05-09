; DESCRIPTION: Composite: Draws a white rectangle at (71, 10) with width 33 and height 19 then Sets a single blue pixel at (168, 90).
; PLAN: r0=71(x), r1=10(y), r2=33(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=90(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 10
LDI r2, 33
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 90
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
