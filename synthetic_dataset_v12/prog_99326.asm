; DESCRIPTION: Creates a black rectangular region at (274, 132) spanning 32 by 71 pixels.
; PLAN: r0=274(x), r1=132(y), r2=32(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 132
LDI r2, 32
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
