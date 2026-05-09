; DESCRIPTION: Places a black 50x13 rectangle at position (64, 203).
; PLAN: r0=64(x), r1=203(y), r2=50(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 203
LDI r2, 50
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
