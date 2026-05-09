; DESCRIPTION: Places a cyan 67x22 rectangle at position (95, 72).
; PLAN: r0=95(x), r1=72(y), r2=67(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 72
LDI r2, 67
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
