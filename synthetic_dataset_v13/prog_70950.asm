; DESCRIPTION: Places a blue 67x53 rectangle at position (223, 76).
; PLAN: r0=223(x), r1=76(y), r2=67(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 76
LDI r2, 67
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
