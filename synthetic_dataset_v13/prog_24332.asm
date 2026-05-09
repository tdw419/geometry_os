; DESCRIPTION: Places a red 95x105 rectangle at position (334, 53).
; PLAN: r0=334(x), r1=53(y), r2=95(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 53
LDI r2, 95
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
