; DESCRIPTION: Creates a blue rectangular region at (38, 38) spanning 98 by 99 pixels.
; PLAN: r0=38(x), r1=38(y), r2=98(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 38
LDI r2, 98
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
