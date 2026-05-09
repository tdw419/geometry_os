; DESCRIPTION: Places a black 77x120 rectangle at position (157, 72).
; PLAN: r0=157(x), r1=72(y), r2=77(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 72
LDI r2, 77
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
