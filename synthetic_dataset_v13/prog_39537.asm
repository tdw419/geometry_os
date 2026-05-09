; DESCRIPTION: Places a black 10x88 rectangle at position (455, 98).
; PLAN: r0=455(x), r1=98(y), r2=10(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 98
LDI r2, 10
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
