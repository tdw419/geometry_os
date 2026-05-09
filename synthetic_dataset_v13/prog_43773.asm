; DESCRIPTION: Composite: Sets a single blue pixel at (153, 174) then Places a black 111x79 rectangle at position (43, 173).
; PLAN: r0=153(x), r1=174(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=43(x), r6=173(y), r7=111(width), r8=79(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 153
LDI r1, 174
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 43
LDI r6, 173
LDI r7, 111
LDI r8, 79
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
