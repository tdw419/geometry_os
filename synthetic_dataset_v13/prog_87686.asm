; DESCRIPTION: Places a white 67x34 rectangle at position (170, 215).
; PLAN: r0=170(x), r1=215(y), r2=67(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 215
LDI r2, 67
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
