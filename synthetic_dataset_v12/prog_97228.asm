; DESCRIPTION: Places a green 77x78 rectangle at position (304, 67).
; PLAN: r0=304(x), r1=67(y), r2=77(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 67
LDI r2, 77
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
