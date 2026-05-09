; DESCRIPTION: Places a white 53x13 rectangle at position (407, 79).
; PLAN: r0=407(x), r1=79(y), r2=53(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 79
LDI r2, 53
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
