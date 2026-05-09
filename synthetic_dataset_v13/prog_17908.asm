; DESCRIPTION: Places a black 47x64 rectangle at position (203, 78).
; PLAN: r0=203(x), r1=78(y), r2=47(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 78
LDI r2, 47
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
