; DESCRIPTION: Places a black 74x10 rectangle at position (111, 219).
; PLAN: r0=111(x), r1=219(y), r2=74(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 219
LDI r2, 74
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
