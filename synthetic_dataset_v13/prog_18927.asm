; DESCRIPTION: Places a red 67x68 rectangle at position (139, 2).
; PLAN: r0=139(x), r1=2(y), r2=67(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 2
LDI r2, 67
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
