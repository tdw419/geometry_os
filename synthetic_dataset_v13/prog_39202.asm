; DESCRIPTION: Creates a blue rectangular region at (159, 141) spanning 106 by 58 pixels.
; PLAN: r0=159(x), r1=141(y), r2=106(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 141
LDI r2, 106
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
