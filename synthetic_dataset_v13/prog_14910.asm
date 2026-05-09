; DESCRIPTION: Places a cyan 81x96 rectangle at position (128, 123).
; PLAN: r0=128(x), r1=123(y), r2=81(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 123
LDI r2, 81
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
