; DESCRIPTION: Creates a black rectangular region at (383, 135) spanning 45 by 20 pixels.
; PLAN: r0=383(x), r1=135(y), r2=45(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 135
LDI r2, 45
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
