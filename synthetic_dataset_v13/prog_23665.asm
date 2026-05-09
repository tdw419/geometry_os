; DESCRIPTION: Places a black 67x106 rectangle at position (173, 56).
; PLAN: r0=173(x), r1=56(y), r2=67(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 56
LDI r2, 67
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
