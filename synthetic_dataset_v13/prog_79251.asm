; DESCRIPTION: Places a white 105x67 rectangle at position (193, 79).
; PLAN: r0=193(x), r1=79(y), r2=105(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 79
LDI r2, 105
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
