; DESCRIPTION: Places a cyan 19x77 rectangle at position (118, 131).
; PLAN: r0=118(x), r1=131(y), r2=19(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 131
LDI r2, 19
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
