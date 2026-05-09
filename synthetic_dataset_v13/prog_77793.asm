; DESCRIPTION: Places a cyan 78x35 rectangle at position (82, 64).
; PLAN: r0=82(x), r1=64(y), r2=78(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 64
LDI r2, 78
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
