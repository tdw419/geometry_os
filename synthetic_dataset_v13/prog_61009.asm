; DESCRIPTION: Places a cyan 63x118 rectangle at position (414, 81).
; PLAN: r0=414(x), r1=81(y), r2=63(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 81
LDI r2, 63
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
