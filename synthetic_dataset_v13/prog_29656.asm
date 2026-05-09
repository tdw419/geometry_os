; DESCRIPTION: Composite: Places a black dot at position (365, 195) then Places a yellow line segment connecting (497, 139) to (489, 88).
; PLAN: r0=365(x), r1=195(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=497(x1), r6=139(y1), r7=489(x2), r8=88(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 195
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 497
LDI r6, 139
LDI r7, 489
LDI r8, 88
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
