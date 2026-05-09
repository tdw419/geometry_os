; DESCRIPTION: Places a cyan 18x62 rectangle at position (107, 105).
; PLAN: r0=107(x), r1=105(y), r2=18(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 105
LDI r2, 18
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
