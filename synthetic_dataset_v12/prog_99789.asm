; DESCRIPTION: Creates a black rectangular region at (348, 16) spanning 99 by 59 pixels.
; PLAN: r0=348(x), r1=16(y), r2=99(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 16
LDI r2, 99
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
