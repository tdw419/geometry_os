; DESCRIPTION: Creates a black rectangular region at (210, 105) spanning 63 by 30 pixels.
; PLAN: r0=210(x), r1=105(y), r2=63(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 105
LDI r2, 63
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
