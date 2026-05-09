; DESCRIPTION: Composite: Places a black dot at position (486, 178) then Places a blue 69x53 rectangle at position (351, 173).
; PLAN: r0=486(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=351(x), r6=173(y), r7=69(width), r8=53(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 351
LDI r6, 173
LDI r7, 69
LDI r8, 53
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
