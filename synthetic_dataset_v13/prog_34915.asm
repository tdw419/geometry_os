; DESCRIPTION: Creates a red rectangular region at (436, 97) spanning 51 by 78 pixels.
; PLAN: r0=436(x), r1=97(y), r2=51(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 97
LDI r2, 51
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
