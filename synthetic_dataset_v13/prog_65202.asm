; DESCRIPTION: Creates a blue rectangular region at (173, 110) spanning 59 by 108 pixels.
; PLAN: r0=173(x), r1=110(y), r2=59(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 110
LDI r2, 59
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
