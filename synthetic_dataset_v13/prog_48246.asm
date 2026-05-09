; DESCRIPTION: Places a black 86x16 rectangle at position (407, 60).
; PLAN: r0=407(x), r1=60(y), r2=86(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 60
LDI r2, 86
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
