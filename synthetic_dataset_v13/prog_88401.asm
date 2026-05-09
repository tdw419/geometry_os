; DESCRIPTION: Creates a black rectangular region at (471, 135) spanning 20 by 92 pixels.
; PLAN: r0=471(x), r1=135(y), r2=20(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 135
LDI r2, 20
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
