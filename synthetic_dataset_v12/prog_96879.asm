; DESCRIPTION: Composite: Places a white 113x28 rectangle at position (335, 97) then Sets a single yellow pixel at (460, 182).
; PLAN: r0=335(x), r1=97(y), r2=113(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=182(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 97
LDI r2, 113
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 182
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
