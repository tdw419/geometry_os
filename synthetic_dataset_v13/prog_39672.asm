; DESCRIPTION: Places a cyan 29x38 rectangle at position (339, 22).
; PLAN: r0=339(x), r1=22(y), r2=29(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 22
LDI r2, 29
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
