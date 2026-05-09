; DESCRIPTION: Composite: Renders a yellow box of size 97x44 starting at (263, 84) then Sets a single yellow pixel at (289, 178).
; PLAN: r0=263(x), r1=84(y), r2=97(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=178(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 263
LDI r1, 84
LDI r2, 97
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 178
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
