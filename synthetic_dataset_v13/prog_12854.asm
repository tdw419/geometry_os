; DESCRIPTION: Places a red 76x96 rectangle at position (377, 115).
; PLAN: r0=377(x), r1=115(y), r2=76(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 115
LDI r2, 76
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
