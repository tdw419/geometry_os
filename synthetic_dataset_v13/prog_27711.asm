; DESCRIPTION: Places a cyan 101x52 rectangle at position (339, 122).
; PLAN: r0=339(x), r1=122(y), r2=101(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 122
LDI r2, 101
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
