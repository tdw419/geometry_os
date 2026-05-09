; DESCRIPTION: Creates a yellow rectangular region at (204, 86) spanning 43 by 60 pixels.
; PLAN: r0=204(x), r1=86(y), r2=43(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 86
LDI r2, 43
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
