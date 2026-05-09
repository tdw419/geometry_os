; DESCRIPTION: Places a orange 65x28 rectangle at position (378, 199).
; PLAN: r0=378(x), r1=199(y), r2=65(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 199
LDI r2, 65
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
