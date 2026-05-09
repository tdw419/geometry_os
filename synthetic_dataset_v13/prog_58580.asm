; DESCRIPTION: Places a yellow 67x113 rectangle at position (173, 131).
; PLAN: r0=173(x), r1=131(y), r2=67(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 131
LDI r2, 67
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
