; DESCRIPTION: Places a yellow 49x82 rectangle at position (123, 104).
; PLAN: r0=123(x), r1=104(y), r2=49(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 104
LDI r2, 49
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
