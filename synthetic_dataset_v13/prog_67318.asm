; DESCRIPTION: Composite: Places a red 73x100 rectangle at position (65, 15) then Places a black dot at position (317, 74).
; PLAN: r0=65(x), r1=15(y), r2=73(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=74(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 65
LDI r1, 15
LDI r2, 73
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 74
LDI r7, 0x000000
PSET r5, r6, r7
HALT
