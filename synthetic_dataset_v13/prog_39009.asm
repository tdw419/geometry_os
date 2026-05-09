; DESCRIPTION: Creates a green rectangular region at (348, 225) spanning 59 by 24 pixels.
; PLAN: r0=348(x), r1=225(y), r2=59(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 225
LDI r2, 59
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
