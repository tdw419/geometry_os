; DESCRIPTION: Places a black 101x116 rectangle at position (1, 105).
; PLAN: r0=1(x), r1=105(y), r2=101(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 105
LDI r2, 101
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
