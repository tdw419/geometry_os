; DESCRIPTION: Places a yellow 67x35 rectangle at position (71, 69).
; PLAN: r0=71(x), r1=69(y), r2=67(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 69
LDI r2, 67
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
