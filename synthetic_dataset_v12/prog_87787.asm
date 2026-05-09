; DESCRIPTION: Creates a blue rectangular region at (341, 58) spanning 58 by 81 pixels.
; PLAN: r0=341(x), r1=58(y), r2=58(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 58
LDI r2, 58
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
