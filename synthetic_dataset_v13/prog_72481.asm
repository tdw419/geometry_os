; DESCRIPTION: Creates a magenta rectangular region at (396, 144) spanning 12 by 40 pixels.
; PLAN: r0=396(x), r1=144(y), r2=12(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 144
LDI r2, 12
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
