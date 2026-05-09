; DESCRIPTION: Places a green 96x12 rectangle at position (348, 225).
; PLAN: r0=348(x), r1=225(y), r2=96(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 225
LDI r2, 96
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
