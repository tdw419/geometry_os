; DESCRIPTION: Creates a blue rectangular region at (418, 71) spanning 40 by 81 pixels.
; PLAN: r0=418(x), r1=71(y), r2=40(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 71
LDI r2, 40
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
