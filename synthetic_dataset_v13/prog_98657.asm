; DESCRIPTION: Places a red 67x98 rectangle at position (123, 37).
; PLAN: r0=123(x), r1=37(y), r2=67(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 37
LDI r2, 67
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
