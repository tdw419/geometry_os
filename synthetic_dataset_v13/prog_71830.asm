; DESCRIPTION: Places a orange 15x89 rectangle at position (378, 151).
; PLAN: r0=378(x), r1=151(y), r2=15(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 151
LDI r2, 15
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
