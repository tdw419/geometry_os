; DESCRIPTION: Places a red 44x28 rectangle at position (339, 67).
; PLAN: r0=339(x), r1=67(y), r2=44(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 67
LDI r2, 44
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
