; DESCRIPTION: Creates a yellow rectangular region at (138, 157) spanning 49 by 82 pixels.
; PLAN: r0=138(x), r1=157(y), r2=49(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 157
LDI r2, 49
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
