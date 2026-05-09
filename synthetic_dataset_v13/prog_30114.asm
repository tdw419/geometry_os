; DESCRIPTION: Places a black 68x74 rectangle at position (249, 69).
; PLAN: r0=249(x), r1=69(y), r2=68(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 69
LDI r2, 68
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
