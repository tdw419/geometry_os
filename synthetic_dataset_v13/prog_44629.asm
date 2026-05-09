; DESCRIPTION: Creates a black rectangular region at (274, 28) spanning 35 by 91 pixels.
; PLAN: r0=274(x), r1=28(y), r2=35(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 28
LDI r2, 35
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
