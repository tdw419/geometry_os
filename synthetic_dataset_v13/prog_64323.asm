; DESCRIPTION: Creates a blue rectangular region at (258, 34) spanning 26 by 111 pixels.
; PLAN: r0=258(x), r1=34(y), r2=26(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 34
LDI r2, 26
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
