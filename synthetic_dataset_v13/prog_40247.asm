; DESCRIPTION: Places a red 13x12 rectangle at position (397, 166).
; PLAN: r0=397(x), r1=166(y), r2=13(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 166
LDI r2, 13
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
