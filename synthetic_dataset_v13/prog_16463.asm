; DESCRIPTION: Creates a black rectangular region at (192, 105) spanning 81 by 63 pixels.
; PLAN: r0=192(x), r1=105(y), r2=81(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 105
LDI r2, 81
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
