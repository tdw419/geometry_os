; DESCRIPTION: Places a black 36x46 rectangle at position (88, 116).
; PLAN: r0=88(x), r1=116(y), r2=36(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 116
LDI r2, 36
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
