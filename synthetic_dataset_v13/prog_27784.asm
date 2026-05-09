; DESCRIPTION: Creates a blue rectangular region at (304, 154) spanning 119 by 49 pixels.
; PLAN: r0=304(x), r1=154(y), r2=119(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 154
LDI r2, 119
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
