; DESCRIPTION: Creates a blue rectangular region at (233, 3) spanning 17 by 39 pixels.
; PLAN: r0=233(x), r1=3(y), r2=17(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 3
LDI r2, 17
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
