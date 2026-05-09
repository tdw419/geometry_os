; DESCRIPTION: Creates a purple rectangular region at (92, 22) spanning 39 by 15 pixels.
; PLAN: r0=92(x), r1=22(y), r2=39(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 22
LDI r2, 39
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
