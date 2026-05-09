; DESCRIPTION: Creates a purple rectangular region at (310, 73) spanning 68 by 36 pixels.
; PLAN: r0=310(x), r1=73(y), r2=68(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 73
LDI r2, 68
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
