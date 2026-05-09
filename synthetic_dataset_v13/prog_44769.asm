; DESCRIPTION: Creates a blue rectangular region at (204, 65) spanning 112 by 64 pixels.
; PLAN: r0=204(x), r1=65(y), r2=112(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 65
LDI r2, 112
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
