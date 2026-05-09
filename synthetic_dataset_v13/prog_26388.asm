; DESCRIPTION: Places a blue 78x41 rectangle at position (356, 6).
; PLAN: r0=356(x), r1=6(y), r2=78(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 6
LDI r2, 78
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
