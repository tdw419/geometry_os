; DESCRIPTION: Draws a cyan rectangle at (348, 59) with width 109 and height 120.
; PLAN: r0=348(x), r1=59(y), r2=109(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 59
LDI r2, 109
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
