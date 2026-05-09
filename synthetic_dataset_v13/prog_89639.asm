; DESCRIPTION: Places a cyan 105x26 rectangle at position (128, 121).
; PLAN: r0=128(x), r1=121(y), r2=105(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 121
LDI r2, 105
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
