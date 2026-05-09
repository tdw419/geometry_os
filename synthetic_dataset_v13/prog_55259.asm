; DESCRIPTION: Creates a blue rectangular region at (67, 62) spanning 46 by 54 pixels.
; PLAN: r0=67(x), r1=62(y), r2=46(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 62
LDI r2, 46
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
