; DESCRIPTION: Places a black 86x13 rectangle at position (128, 41).
; PLAN: r0=128(x), r1=41(y), r2=86(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 41
LDI r2, 86
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
