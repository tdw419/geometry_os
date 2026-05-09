; DESCRIPTION: Creates a blue rectangular region at (71, 63) spanning 64 by 100 pixels.
; PLAN: r0=71(x), r1=63(y), r2=64(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 63
LDI r2, 64
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
