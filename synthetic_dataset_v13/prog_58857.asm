; DESCRIPTION: Creates a purple rectangular region at (421, 34) spanning 82 by 111 pixels.
; PLAN: r0=421(x), r1=34(y), r2=82(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 34
LDI r2, 82
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
