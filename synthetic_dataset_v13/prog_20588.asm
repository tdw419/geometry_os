; DESCRIPTION: Creates a magenta rectangular region at (402, 142) spanning 64 by 62 pixels.
; PLAN: r0=402(x), r1=142(y), r2=64(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 142
LDI r2, 64
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
