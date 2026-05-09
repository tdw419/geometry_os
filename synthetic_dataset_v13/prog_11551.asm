; DESCRIPTION: Creates a blue rectangular region at (384, 123) spanning 89 by 50 pixels.
; PLAN: r0=384(x), r1=123(y), r2=89(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 123
LDI r2, 89
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
