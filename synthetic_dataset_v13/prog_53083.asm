; DESCRIPTION: Places a cyan 68x108 rectangle at position (67, 128).
; PLAN: r0=67(x), r1=128(y), r2=68(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 128
LDI r2, 68
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
