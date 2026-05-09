; DESCRIPTION: Places a cyan 105x30 rectangle at position (231, 217).
; PLAN: r0=231(x), r1=217(y), r2=105(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 217
LDI r2, 105
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
