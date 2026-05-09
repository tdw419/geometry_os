; DESCRIPTION: Creates a blue rectangular region at (322, 43) spanning 39 by 33 pixels.
; PLAN: r0=322(x), r1=43(y), r2=39(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 43
LDI r2, 39
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
