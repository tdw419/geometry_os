; DESCRIPTION: Places a white 19x56 rectangle at position (122, 76).
; PLAN: r0=122(x), r1=76(y), r2=19(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 76
LDI r2, 19
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
