; DESCRIPTION: Places a yellow 52x72 rectangle at position (311, 64).
; PLAN: r0=311(x), r1=64(y), r2=52(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 64
LDI r2, 52
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
