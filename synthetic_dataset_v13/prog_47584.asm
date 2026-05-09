; DESCRIPTION: Places a yellow 14x12 rectangle at position (383, 128).
; PLAN: r0=383(x), r1=128(y), r2=14(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 128
LDI r2, 14
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
