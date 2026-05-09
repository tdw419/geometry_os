; DESCRIPTION: Places a orange 43x67 rectangle at position (396, 171).
; PLAN: r0=396(x), r1=171(y), r2=43(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 171
LDI r2, 43
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
