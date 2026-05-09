; DESCRIPTION: Composite: Places a red 52x82 rectangle at position (442, 135) then Places a green dot at position (490, 157).
; PLAN: r0=442(x), r1=135(y), r2=52(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=157(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 442
LDI r1, 135
LDI r2, 52
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 157
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
