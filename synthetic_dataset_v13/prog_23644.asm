; DESCRIPTION: Places a yellow 45x101 rectangle at position (121, 0).
; PLAN: r0=121(x), r1=0(y), r2=45(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 0
LDI r2, 45
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
