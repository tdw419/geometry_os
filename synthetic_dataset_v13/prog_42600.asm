; DESCRIPTION: Creates a purple rectangular region at (265, 31) spanning 19 by 111 pixels.
; PLAN: r0=265(x), r1=31(y), r2=19(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 31
LDI r2, 19
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
