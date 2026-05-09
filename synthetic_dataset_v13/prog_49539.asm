; DESCRIPTION: Places a black 100x95 rectangle at position (196, 81).
; PLAN: r0=196(x), r1=81(y), r2=100(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 81
LDI r2, 100
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
