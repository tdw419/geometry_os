; DESCRIPTION: Places a yellow 116x69 rectangle at position (327, 2).
; PLAN: r0=327(x), r1=2(y), r2=116(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 2
LDI r2, 116
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
