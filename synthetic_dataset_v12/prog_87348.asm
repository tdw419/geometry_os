; DESCRIPTION: Places a yellow 49x49 rectangle at position (124, 114).
; PLAN: r0=124(x), r1=114(y), r2=49(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 114
LDI r2, 49
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
