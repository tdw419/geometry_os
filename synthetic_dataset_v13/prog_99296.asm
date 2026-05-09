; DESCRIPTION: Creates a purple rectangular region at (19, 39) spanning 61 by 17 pixels.
; PLAN: r0=19(x), r1=39(y), r2=61(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 39
LDI r2, 61
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
