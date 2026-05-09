; DESCRIPTION: Places a black 14x98 rectangle at position (116, 75).
; PLAN: r0=116(x), r1=75(y), r2=14(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 75
LDI r2, 14
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
