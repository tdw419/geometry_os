; DESCRIPTION: Creates a magenta rectangular region at (222, 160) spanning 13 by 32 pixels.
; PLAN: r0=222(x), r1=160(y), r2=13(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 160
LDI r2, 13
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
