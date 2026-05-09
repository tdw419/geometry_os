; DESCRIPTION: Places a cyan 67x18 rectangle at position (101, 70).
; PLAN: r0=101(x), r1=70(y), r2=67(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 70
LDI r2, 67
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
