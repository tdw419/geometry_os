; DESCRIPTION: Places a black 32x114 rectangle at position (27, 86).
; PLAN: r0=27(x), r1=86(y), r2=32(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 86
LDI r2, 32
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
