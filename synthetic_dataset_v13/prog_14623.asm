; DESCRIPTION: Places a cyan 73x48 rectangle at position (62, 68).
; PLAN: r0=62(x), r1=68(y), r2=73(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 68
LDI r2, 73
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
