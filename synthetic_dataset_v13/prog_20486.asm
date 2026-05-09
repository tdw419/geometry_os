; DESCRIPTION: Places a yellow 26x88 rectangle at position (477, 6).
; PLAN: r0=477(x), r1=6(y), r2=26(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 6
LDI r2, 26
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
