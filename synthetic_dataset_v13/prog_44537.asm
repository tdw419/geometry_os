; DESCRIPTION: Composite: Renders a black box of size 86x108 starting at (183, 74) then Places a cyan dot at position (240, 9).
; PLAN: r0=183(x), r1=74(y), r2=86(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=9(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 183
LDI r1, 74
LDI r2, 86
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 9
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
