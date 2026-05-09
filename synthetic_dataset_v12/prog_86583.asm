; DESCRIPTION: Composite: Draws a blue rectangle at (289, 164) with width 71 and height 60 then Sets a single magenta pixel at (14, 93).
; PLAN: r0=289(x), r1=164(y), r2=71(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=14(x), r6=93(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 289
LDI r1, 164
LDI r2, 71
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 93
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
