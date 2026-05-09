; DESCRIPTION: Places a red 97x72 rectangle at position (275, 67).
; PLAN: r0=275(x), r1=67(y), r2=97(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 67
LDI r2, 97
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
