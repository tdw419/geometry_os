; DESCRIPTION: Places a cyan 116x15 rectangle at position (189, 161).
; PLAN: r0=189(x), r1=161(y), r2=116(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 161
LDI r2, 116
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
