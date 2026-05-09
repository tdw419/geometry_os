; DESCRIPTION: Creates a blue rectangular region at (210, 12) spanning 31 by 71 pixels.
; PLAN: r0=210(x), r1=12(y), r2=31(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 12
LDI r2, 31
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
