; DESCRIPTION: Places a black 52x20 rectangle at position (138, 88).
; PLAN: r0=138(x), r1=88(y), r2=52(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 88
LDI r2, 52
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
