; DESCRIPTION: Creates a blue rectangular region at (273, 183) spanning 76 by 36 pixels.
; PLAN: r0=273(x), r1=183(y), r2=76(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 183
LDI r2, 76
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
