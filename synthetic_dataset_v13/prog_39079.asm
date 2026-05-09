; DESCRIPTION: Places a cyan 38x76 rectangle at position (226, 89).
; PLAN: r0=226(x), r1=89(y), r2=38(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 89
LDI r2, 38
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
