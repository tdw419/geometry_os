; DESCRIPTION: Places a cyan 107x35 rectangle at position (14, 77).
; PLAN: r0=14(x), r1=77(y), r2=107(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 77
LDI r2, 107
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
