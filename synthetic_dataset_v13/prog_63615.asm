; DESCRIPTION: Creates a purple rectangular region at (298, 92) spanning 78 by 28 pixels.
; PLAN: r0=298(x), r1=92(y), r2=78(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 92
LDI r2, 78
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
