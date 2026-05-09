; DESCRIPTION: Places a blue 67x46 rectangle at position (133, 108).
; PLAN: r0=133(x), r1=108(y), r2=67(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 108
LDI r2, 67
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
