; DESCRIPTION: Creates a blue rectangular region at (17, 59) spanning 113 by 119 pixels.
; PLAN: r0=17(x), r1=59(y), r2=113(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 59
LDI r2, 113
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
