; DESCRIPTION: Creates a blue rectangular region at (47, 38) spanning 55 by 91 pixels.
; PLAN: r0=47(x), r1=38(y), r2=55(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 38
LDI r2, 55
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
