; DESCRIPTION: Places a cyan 73x78 rectangle at position (117, 109).
; PLAN: r0=117(x), r1=109(y), r2=73(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 109
LDI r2, 73
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
