; DESCRIPTION: Places a cyan 62x87 rectangle at position (339, 140).
; PLAN: r0=339(x), r1=140(y), r2=62(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 140
LDI r2, 62
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
