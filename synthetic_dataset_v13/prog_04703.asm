; DESCRIPTION: Creates a blue rectangular region at (349, 71) spanning 71 by 38 pixels.
; PLAN: r0=349(x), r1=71(y), r2=71(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 71
LDI r2, 71
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
