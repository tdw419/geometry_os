; DESCRIPTION: Creates a blue rectangular region at (234, 115) spanning 31 by 111 pixels.
; PLAN: r0=234(x), r1=115(y), r2=31(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 115
LDI r2, 31
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
