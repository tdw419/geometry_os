; DESCRIPTION: Places a black 86x74 rectangle at position (68, 110).
; PLAN: r0=68(x), r1=110(y), r2=86(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 110
LDI r2, 86
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
