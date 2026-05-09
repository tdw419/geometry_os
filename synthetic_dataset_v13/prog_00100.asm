; DESCRIPTION: Creates a blue rectangular region at (299, 111) spanning 70 by 102 pixels.
; PLAN: r0=299(x), r1=111(y), r2=70(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 111
LDI r2, 70
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
