; DESCRIPTION: Creates a blue rectangular region at (204, 204) spanning 25 by 31 pixels.
; PLAN: r0=204(x), r1=204(y), r2=25(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 204
LDI r2, 25
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
