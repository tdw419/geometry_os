; DESCRIPTION: Places a green 118x49 rectangle at position (348, 137).
; PLAN: r0=348(x), r1=137(y), r2=118(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 137
LDI r2, 118
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
