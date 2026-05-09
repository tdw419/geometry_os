; DESCRIPTION: Places a white 67x85 rectangle at position (96, 119).
; PLAN: r0=96(x), r1=119(y), r2=67(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 119
LDI r2, 67
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
