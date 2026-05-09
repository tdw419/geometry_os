; DESCRIPTION: Creates a black rectangular region at (407, 98) spanning 30 by 93 pixels.
; PLAN: r0=407(x), r1=98(y), r2=30(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 98
LDI r2, 30
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
