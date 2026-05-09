; DESCRIPTION: Creates a blue rectangular region at (348, 125) spanning 18 by 115 pixels.
; PLAN: r0=348(x), r1=125(y), r2=18(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 125
LDI r2, 18
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
