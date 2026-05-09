; DESCRIPTION: Composite: Draws a cyan rectangle at (57, 134) with width 114 and height 96 then Sets a single magenta pixel at (258, 138).
; PLAN: r0=57(x), r1=134(y), r2=114(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=138(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 57
LDI r1, 134
LDI r2, 114
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 138
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
