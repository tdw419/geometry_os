; DESCRIPTION: Composite: Renders a blue box of size 97x64 starting at (347, 171) then Sets a single purple pixel at (444, 135).
; PLAN: r0=347(x), r1=171(y), r2=97(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=444(x), r6=135(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 347
LDI r1, 171
LDI r2, 97
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 135
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
