; DESCRIPTION: Composite: Renders a purple box of size 11x17 starting at (47, 151) then Places a black dot at position (59, 4).
; PLAN: r0=47(x), r1=151(y), r2=11(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=4(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 151
LDI r2, 11
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 4
LDI r7, 0x000000
PSET r5, r6, r7
HALT
