; DESCRIPTION: Creates a black rectangular region at (58, 24) spanning 109 by 112 pixels.
; PLAN: r0=58(x), r1=24(y), r2=109(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 24
LDI r2, 109
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
