; DESCRIPTION: Composite: Draws a blue rectangle at (373, 191) with width 80 and height 25 then Places a purple dot at position (429, 114).
; PLAN: r0=373(x), r1=191(y), r2=80(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=429(x), r6=114(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 191
LDI r2, 80
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 114
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
