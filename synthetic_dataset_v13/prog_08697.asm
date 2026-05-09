; DESCRIPTION: Creates a black rectangular region at (214, 199) spanning 111 by 49 pixels.
; PLAN: r0=214(x), r1=199(y), r2=111(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 199
LDI r2, 111
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
