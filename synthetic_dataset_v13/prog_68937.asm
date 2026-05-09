; DESCRIPTION: Places a yellow 110x117 rectangle at position (348, 113).
; PLAN: r0=348(x), r1=113(y), r2=110(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 113
LDI r2, 110
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
