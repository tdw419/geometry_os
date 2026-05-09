; DESCRIPTION: Creates a blue rectangular region at (233, 105) spanning 40 by 109 pixels.
; PLAN: r0=233(x), r1=105(y), r2=40(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 105
LDI r2, 40
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
