; DESCRIPTION: Draws a cyan rectangle at (348, 108) with width 49 and height 112.
; PLAN: r0=348(x), r1=108(y), r2=49(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 108
LDI r2, 49
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
