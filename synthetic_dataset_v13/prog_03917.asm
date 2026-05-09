; DESCRIPTION: Composite: Renders a cyan box of size 108x32 starting at (213, 98) then Sets a single black pixel at (490, 189).
; PLAN: r0=213(x), r1=98(y), r2=108(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 213
LDI r1, 98
LDI r2, 108
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
HALT
