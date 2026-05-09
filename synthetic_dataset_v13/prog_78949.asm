; DESCRIPTION: Places a green 74x31 rectangle at position (383, 184).
; PLAN: r0=383(x), r1=184(y), r2=74(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 184
LDI r2, 74
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
