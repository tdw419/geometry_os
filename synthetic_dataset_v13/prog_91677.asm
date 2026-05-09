; DESCRIPTION: Places a cyan 34x10 rectangle at position (348, 57).
; PLAN: r0=348(x), r1=57(y), r2=34(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 57
LDI r2, 34
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
