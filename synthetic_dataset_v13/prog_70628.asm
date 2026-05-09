; DESCRIPTION: Places a cyan 49x62 rectangle at position (231, 108).
; PLAN: r0=231(x), r1=108(y), r2=49(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 108
LDI r2, 49
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
