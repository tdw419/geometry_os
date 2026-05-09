; DESCRIPTION: Creates a blue rectangular region at (129, 62) spanning 47 by 107 pixels.
; PLAN: r0=129(x), r1=62(y), r2=47(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 62
LDI r2, 47
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
