; DESCRIPTION: Creates a magenta rectangular region at (348, 174) spanning 91 by 27 pixels.
; PLAN: r0=348(x), r1=174(y), r2=91(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 174
LDI r2, 91
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
