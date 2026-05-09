; DESCRIPTION: Places a yellow 55x95 rectangle at position (67, 69).
; PLAN: r0=67(x), r1=69(y), r2=55(width), r3=95(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 69
LDI r2, 55
LDI r3, 95
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
