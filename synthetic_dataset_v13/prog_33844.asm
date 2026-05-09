; DESCRIPTION: Creates a black rectangular region at (19, 112) spanning 96 by 20 pixels.
; PLAN: r0=19(x), r1=112(y), r2=96(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 112
LDI r2, 96
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
