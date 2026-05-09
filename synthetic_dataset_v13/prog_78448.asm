; DESCRIPTION: Creates a blue rectangular region at (310, 68) spanning 80 by 71 pixels.
; PLAN: r0=310(x), r1=68(y), r2=80(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 68
LDI r2, 80
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
