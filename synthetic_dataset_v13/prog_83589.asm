; DESCRIPTION: Places a white 119x67 rectangle at position (31, 75).
; PLAN: r0=31(x), r1=75(y), r2=119(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 75
LDI r2, 119
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
