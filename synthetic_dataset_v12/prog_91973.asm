; DESCRIPTION: Places a yellow 34x58 rectangle at position (64, 69).
; PLAN: r0=64(x), r1=69(y), r2=34(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 69
LDI r2, 34
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
