; DESCRIPTION: Creates a magenta rectangular region at (63, 144) spanning 76 by 32 pixels.
; PLAN: r0=63(x), r1=144(y), r2=76(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 144
LDI r2, 76
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
