; DESCRIPTION: Creates a black rectangular region at (329, 95) spanning 77 by 112 pixels.
; PLAN: r0=329(x), r1=95(y), r2=77(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 95
LDI r2, 77
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
