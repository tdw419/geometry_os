; DESCRIPTION: Creates a black rectangular region at (302, 204) spanning 84 by 13 pixels.
; PLAN: r0=302(x), r1=204(y), r2=84(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 204
LDI r2, 84
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
