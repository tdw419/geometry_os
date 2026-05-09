; DESCRIPTION: Places a yellow 18x22 rectangle at position (67, 102).
; PLAN: r0=67(x), r1=102(y), r2=18(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 102
LDI r2, 18
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
