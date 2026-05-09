; DESCRIPTION: Places a white 60x72 rectangle at position (356, 78).
; PLAN: r0=356(x), r1=78(y), r2=60(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 78
LDI r2, 60
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
