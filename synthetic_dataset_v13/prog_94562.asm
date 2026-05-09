; DESCRIPTION: Places a black 117x88 rectangle at position (310, 32).
; PLAN: r0=310(x), r1=32(y), r2=117(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 32
LDI r2, 117
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
