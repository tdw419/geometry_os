; DESCRIPTION: Creates a black rectangular region at (398, 92) spanning 97 by 81 pixels.
; PLAN: r0=398(x), r1=92(y), r2=97(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 92
LDI r2, 97
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
