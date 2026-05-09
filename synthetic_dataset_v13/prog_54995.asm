; DESCRIPTION: Composite: Draws a cyan rectangle at (122, 131) with width 13 and height 88 then Sets a single blue pixel at (356, 48).
; PLAN: r0=122(x), r1=131(y), r2=13(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=356(x), r6=48(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 122
LDI r1, 131
LDI r2, 13
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 356
LDI r6, 48
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
