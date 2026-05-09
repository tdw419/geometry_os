; DESCRIPTION: Places a orange 113x71 rectangle at position (213, 67).
; PLAN: r0=213(x), r1=67(y), r2=113(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 67
LDI r2, 113
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
