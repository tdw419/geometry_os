; DESCRIPTION: Composite: Sets a single blue pixel at (19, 198) then Places a purple 26x84 rectangle at position (33, 21).
; PLAN: r0=19(x), r1=198(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=21(y), r7=26(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 198
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 21
LDI r7, 26
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
