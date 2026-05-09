; DESCRIPTION: Places a white 101x97 rectangle at position (3, 115).
; PLAN: r0=3(x), r1=115(y), r2=101(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 115
LDI r2, 101
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
