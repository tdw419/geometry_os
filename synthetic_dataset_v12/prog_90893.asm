; DESCRIPTION: Places a purple 114x78 rectangle at position (59, 171).
; PLAN: r0=59(x), r1=171(y), r2=114(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 171
LDI r2, 114
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
