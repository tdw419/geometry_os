; DESCRIPTION: Places a cyan 69x41 rectangle at position (378, 199).
; PLAN: r0=378(x), r1=199(y), r2=69(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 199
LDI r2, 69
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
