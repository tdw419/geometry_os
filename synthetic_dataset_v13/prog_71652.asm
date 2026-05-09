; DESCRIPTION: Places a cyan 43x95 rectangle at position (97, 158).
; PLAN: r0=97(x), r1=158(y), r2=43(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 158
LDI r2, 43
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
