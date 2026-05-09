; DESCRIPTION: Places a orange 114x112 rectangle at position (232, 57).
; PLAN: r0=232(x), r1=57(y), r2=114(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 57
LDI r2, 114
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
