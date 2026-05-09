; DESCRIPTION: Places a cyan 82x88 rectangle at position (31, 98).
; PLAN: r0=31(x), r1=98(y), r2=82(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 98
LDI r2, 82
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
