; DESCRIPTION: Places a yellow 73x58 rectangle at position (316, 157).
; PLAN: r0=316(x), r1=157(y), r2=73(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 157
LDI r2, 73
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
