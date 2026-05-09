; DESCRIPTION: Creates a blue rectangular region at (178, 183) spanning 72 by 73 pixels.
; PLAN: r0=178(x), r1=183(y), r2=72(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 183
LDI r2, 72
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
