; DESCRIPTION: Creates a blue rectangular region at (183, 82) spanning 100 by 88 pixels.
; PLAN: r0=183(x), r1=82(y), r2=100(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 82
LDI r2, 100
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
