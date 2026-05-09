; DESCRIPTION: Places a red 105x71 rectangle at position (222, 53).
; PLAN: r0=222(x), r1=53(y), r2=105(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 53
LDI r2, 105
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
