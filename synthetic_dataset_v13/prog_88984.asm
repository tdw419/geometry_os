; DESCRIPTION: Places a white 49x31 rectangle at position (207, 56).
; PLAN: r0=207(x), r1=56(y), r2=49(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 56
LDI r2, 49
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
