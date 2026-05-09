; DESCRIPTION: Creates a black rectangular region at (25, 192) spanning 45 by 24 pixels.
; PLAN: r0=25(x), r1=192(y), r2=45(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 192
LDI r2, 45
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
