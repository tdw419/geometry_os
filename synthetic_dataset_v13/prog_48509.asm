; DESCRIPTION: Places a cyan 10x67 rectangle at position (283, 157).
; PLAN: r0=283(x), r1=157(y), r2=10(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 157
LDI r2, 10
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
