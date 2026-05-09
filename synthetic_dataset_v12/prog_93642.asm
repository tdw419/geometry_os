; DESCRIPTION: Creates a blue rectangular region at (384, 68) spanning 24 by 66 pixels.
; PLAN: r0=384(x), r1=68(y), r2=24(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 68
LDI r2, 24
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
