; DESCRIPTION: Creates a blue rectangular region at (356, 204) spanning 78 by 40 pixels.
; PLAN: r0=356(x), r1=204(y), r2=78(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 204
LDI r2, 78
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
