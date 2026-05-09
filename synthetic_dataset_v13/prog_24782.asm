; DESCRIPTION: Places a red 73x79 rectangle at position (397, 12).
; PLAN: r0=397(x), r1=12(y), r2=73(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 12
LDI r2, 73
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
