; DESCRIPTION: Places a black 27x74 rectangle at position (376, 23).
; PLAN: r0=376(x), r1=23(y), r2=27(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 23
LDI r2, 27
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
