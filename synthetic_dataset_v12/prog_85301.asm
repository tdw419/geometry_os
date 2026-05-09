; DESCRIPTION: Places a black 96x117 rectangle at position (348, 91).
; PLAN: r0=348(x), r1=91(y), r2=96(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 91
LDI r2, 96
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
