; DESCRIPTION: Creates a black rectangular region at (135, 96) spanning 45 by 102 pixels.
; PLAN: r0=135(x), r1=96(y), r2=45(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 96
LDI r2, 45
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
