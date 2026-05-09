; DESCRIPTION: Composite: Renders a green box of size 11x13 starting at (384, 132) then Places a cyan dot at position (483, 233).
; PLAN: r0=384(x), r1=132(y), r2=11(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=483(x), r6=233(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 384
LDI r1, 132
LDI r2, 11
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 233
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
