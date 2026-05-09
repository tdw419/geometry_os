; DESCRIPTION: Places a blue 107x59 rectangle at position (348, 41).
; PLAN: r0=348(x), r1=41(y), r2=107(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 41
LDI r2, 107
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
