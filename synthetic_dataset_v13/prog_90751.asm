; DESCRIPTION: Places a black 23x64 rectangle at position (449, 103).
; PLAN: r0=449(x), r1=103(y), r2=23(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 103
LDI r2, 23
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
