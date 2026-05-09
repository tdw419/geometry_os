; DESCRIPTION: Places a orange 71x89 rectangle at position (26, 82).
; PLAN: r0=26(x), r1=82(y), r2=71(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 82
LDI r2, 71
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
