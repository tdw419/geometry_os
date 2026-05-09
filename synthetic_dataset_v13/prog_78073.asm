; DESCRIPTION: Creates a black rectangular region at (102, 20) spanning 51 by 39 pixels.
; PLAN: r0=102(x), r1=20(y), r2=51(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 20
LDI r2, 51
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
