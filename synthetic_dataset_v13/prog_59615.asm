; DESCRIPTION: Creates a red rectangular region at (348, 135) spanning 72 by 112 pixels.
; PLAN: r0=348(x), r1=135(y), r2=72(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 135
LDI r2, 72
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
