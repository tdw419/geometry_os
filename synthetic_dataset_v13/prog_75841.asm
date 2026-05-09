; DESCRIPTION: Places a cyan 24x22 rectangle at position (299, 128).
; PLAN: r0=299(x), r1=128(y), r2=24(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 128
LDI r2, 24
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
