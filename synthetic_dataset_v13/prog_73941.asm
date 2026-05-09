; DESCRIPTION: Places a cyan 86x12 rectangle at position (101, 155).
; PLAN: r0=101(x), r1=155(y), r2=86(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 155
LDI r2, 86
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
