; DESCRIPTION: Creates a blue rectangular region at (285, 34) spanning 59 by 108 pixels.
; PLAN: r0=285(x), r1=34(y), r2=59(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 34
LDI r2, 59
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
