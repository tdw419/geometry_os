; DESCRIPTION: Creates a blue rectangular region at (348, 25) spanning 28 by 79 pixels.
; PLAN: r0=348(x), r1=25(y), r2=28(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 25
LDI r2, 28
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
