; DESCRIPTION: Places a black 19x72 rectangle at position (177, 62).
; PLAN: r0=177(x), r1=62(y), r2=19(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 62
LDI r2, 19
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
