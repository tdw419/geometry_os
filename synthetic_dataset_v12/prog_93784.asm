; DESCRIPTION: Places a white 96x117 rectangle at position (101, 122).
; PLAN: r0=101(x), r1=122(y), r2=96(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 122
LDI r2, 96
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
