; DESCRIPTION: Composite: Renders a purple box of size 111x16 starting at (165, 192) then Places a black dot at position (316, 178).
; PLAN: r0=165(x), r1=192(y), r2=111(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=178(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 192
LDI r2, 111
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 178
LDI r7, 0x000000
PSET r5, r6, r7
HALT
