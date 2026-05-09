; DESCRIPTION: Places a cyan 76x73 rectangle at position (88, 21).
; PLAN: r0=88(x), r1=21(y), r2=76(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 21
LDI r2, 76
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
