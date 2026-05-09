; DESCRIPTION: Creates a blue rectangular region at (64, 81) spanning 48 by 63 pixels.
; PLAN: r0=64(x), r1=81(y), r2=48(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 81
LDI r2, 48
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
