; DESCRIPTION: Places a black 37x120 rectangle at position (472, 88).
; PLAN: r0=472(x), r1=88(y), r2=37(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 88
LDI r2, 37
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
