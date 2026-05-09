; DESCRIPTION: Places a white 114x53 rectangle at position (388, 63).
; PLAN: r0=388(x), r1=63(y), r2=114(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 63
LDI r2, 114
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
