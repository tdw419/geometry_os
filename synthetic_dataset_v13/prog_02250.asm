; DESCRIPTION: Creates a orange rectangular region at (474, 14) spanning 17 by 112 pixels.
; PLAN: r0=474(x), r1=14(y), r2=17(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 14
LDI r2, 17
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
