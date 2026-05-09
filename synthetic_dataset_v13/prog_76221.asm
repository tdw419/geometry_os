; DESCRIPTION: Composite: Sets a single red pixel at (378, 132) then Places a magenta 62x76 rectangle at position (243, 21).
; PLAN: r0=378(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=21(y), r7=62(width), r8=76(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 243
LDI r6, 21
LDI r7, 62
LDI r8, 76
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
