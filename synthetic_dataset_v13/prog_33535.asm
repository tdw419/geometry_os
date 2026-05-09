; DESCRIPTION: Composite: Draws a blue rectangle at (293, 191) with width 60 and height 44 then Sets a single blue pixel at (459, 40).
; PLAN: r0=293(x), r1=191(y), r2=60(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=40(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 293
LDI r1, 191
LDI r2, 60
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 40
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
