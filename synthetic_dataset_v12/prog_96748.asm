; DESCRIPTION: Creates a black rectangular region at (184, 98) spanning 39 by 22 pixels.
; PLAN: r0=184(x), r1=98(y), r2=39(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 98
LDI r2, 39
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
