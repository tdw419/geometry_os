; DESCRIPTION: Places a black 13x103 rectangle at position (68, 69).
; PLAN: r0=68(x), r1=69(y), r2=13(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 69
LDI r2, 13
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
