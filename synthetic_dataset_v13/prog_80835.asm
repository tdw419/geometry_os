; DESCRIPTION: Places a black 29x120 rectangle at position (469, 100).
; PLAN: r0=469(x), r1=100(y), r2=29(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 100
LDI r2, 29
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
