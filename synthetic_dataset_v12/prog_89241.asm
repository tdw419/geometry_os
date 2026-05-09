; DESCRIPTION: Places a cyan 16x58 rectangle at position (299, 66).
; PLAN: r0=299(x), r1=66(y), r2=16(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 66
LDI r2, 16
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
