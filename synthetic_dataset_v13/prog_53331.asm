; DESCRIPTION: Places a white 73x15 rectangle at position (299, 199).
; PLAN: r0=299(x), r1=199(y), r2=73(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 199
LDI r2, 73
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
