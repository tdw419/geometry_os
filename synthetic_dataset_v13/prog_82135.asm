; DESCRIPTION: Creates a blue rectangular region at (101, 204) spanning 101 by 46 pixels.
; PLAN: r0=101(x), r1=204(y), r2=101(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 204
LDI r2, 101
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
