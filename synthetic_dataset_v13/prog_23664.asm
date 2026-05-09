; DESCRIPTION: Places a black 23x86 rectangle at position (381, 74).
; PLAN: r0=381(x), r1=74(y), r2=23(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 74
LDI r2, 23
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
