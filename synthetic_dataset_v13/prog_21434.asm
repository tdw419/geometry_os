; DESCRIPTION: Places a cyan 87x108 rectangle at position (94, 101).
; PLAN: r0=94(x), r1=101(y), r2=87(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 101
LDI r2, 87
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
