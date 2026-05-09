; DESCRIPTION: Creates a blue rectangular region at (274, 125) spanning 17 by 112 pixels.
; PLAN: r0=274(x), r1=125(y), r2=17(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 125
LDI r2, 17
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
