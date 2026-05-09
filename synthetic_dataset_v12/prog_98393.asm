; DESCRIPTION: Creates a magenta rectangular region at (440, 86) spanning 64 by 31 pixels.
; PLAN: r0=440(x), r1=86(y), r2=64(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 86
LDI r2, 64
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
