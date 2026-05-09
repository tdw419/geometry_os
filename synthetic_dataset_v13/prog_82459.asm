; DESCRIPTION: Places a green 51x58 rectangle at position (348, 36).
; PLAN: r0=348(x), r1=36(y), r2=51(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 36
LDI r2, 51
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
