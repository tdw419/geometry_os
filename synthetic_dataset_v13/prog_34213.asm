; DESCRIPTION: Composite: Renders a black box of size 57x104 starting at (311, 132) then Places a cyan dot at position (494, 209).
; PLAN: r0=311(x), r1=132(y), r2=57(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=209(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 311
LDI r1, 132
LDI r2, 57
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 209
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
