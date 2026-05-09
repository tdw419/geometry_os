; DESCRIPTION: Places a red 19x109 rectangle at position (67, 59).
; PLAN: r0=67(x), r1=59(y), r2=19(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 59
LDI r2, 19
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
