; DESCRIPTION: Creates a black rectangular region at (56, 98) spanning 68 by 112 pixels.
; PLAN: r0=56(x), r1=98(y), r2=68(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 98
LDI r2, 68
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
