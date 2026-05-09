; DESCRIPTION: Places a white 56x67 rectangle at position (105, 7).
; PLAN: r0=105(x), r1=7(y), r2=56(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 7
LDI r2, 56
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
