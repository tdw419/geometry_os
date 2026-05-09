; DESCRIPTION: Creates a black rectangular region at (151, 163) spanning 58 by 73 pixels.
; PLAN: r0=151(x), r1=163(y), r2=58(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 163
LDI r2, 58
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
