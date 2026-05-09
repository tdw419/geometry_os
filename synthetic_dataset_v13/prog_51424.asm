; DESCRIPTION: Places a yellow 114x73 rectangle at position (156, 53).
; PLAN: r0=156(x), r1=53(y), r2=114(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 53
LDI r2, 114
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
