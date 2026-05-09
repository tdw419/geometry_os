; DESCRIPTION: Places a red 18x76 rectangle at position (97, 109).
; PLAN: r0=97(x), r1=109(y), r2=18(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 109
LDI r2, 18
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
