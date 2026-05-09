; DESCRIPTION: Places a blue 26x74 rectangle at position (365, 13).
; PLAN: r0=365(x), r1=13(y), r2=26(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 13
LDI r2, 26
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
