; DESCRIPTION: Places a yellow 101x49 rectangle at position (337, 100).
; PLAN: r0=337(x), r1=100(y), r2=101(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 100
LDI r2, 101
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
