; DESCRIPTION: Places a red 53x96 rectangle at position (334, 6).
; PLAN: r0=334(x), r1=6(y), r2=53(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 6
LDI r2, 53
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
