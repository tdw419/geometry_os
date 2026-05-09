; DESCRIPTION: Places a white 34x95 rectangle at position (59, 88).
; PLAN: r0=59(x), r1=88(y), r2=34(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 88
LDI r2, 34
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
