; DESCRIPTION: Places a yellow 101x25 rectangle at position (388, 53).
; PLAN: r0=388(x), r1=53(y), r2=101(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 53
LDI r2, 101
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
