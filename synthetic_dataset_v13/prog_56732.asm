; DESCRIPTION: Places a red 59x67 rectangle at position (67, 54).
; PLAN: r0=67(x), r1=54(y), r2=59(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 54
LDI r2, 59
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
