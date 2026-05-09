; DESCRIPTION: Creates a blue rectangular region at (403, 6) spanning 35 by 14 pixels.
; PLAN: r0=403(x), r1=6(y), r2=35(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 6
LDI r2, 35
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
