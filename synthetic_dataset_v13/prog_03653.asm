; DESCRIPTION: Renders a blue box of size 97x105 starting at (348, 113).
; PLAN: r0=348(x), r1=113(y), r2=97(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 113
LDI r2, 97
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
