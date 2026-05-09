; DESCRIPTION: Places a cyan 79x59 rectangle at position (348, 118).
; PLAN: r0=348(x), r1=118(y), r2=79(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 118
LDI r2, 79
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
