; DESCRIPTION: Composite: Draws a blue rectangle at (4, 60) with width 48 and height 102 then Sets a single purple pixel at (101, 250).
; PLAN: r0=4(x), r1=60(y), r2=48(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x), r6=250(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 60
LDI r2, 48
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 250
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
