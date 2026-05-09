; DESCRIPTION: Creates a blue rectangular region at (71, 108) spanning 24 by 81 pixels.
; PLAN: r0=71(x), r1=108(y), r2=24(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 108
LDI r2, 24
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
