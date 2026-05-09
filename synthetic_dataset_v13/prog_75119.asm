; DESCRIPTION: Creates a blue rectangular region at (324, 63) spanning 65 by 112 pixels.
; PLAN: r0=324(x), r1=63(y), r2=65(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 63
LDI r2, 65
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
