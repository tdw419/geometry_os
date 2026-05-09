; DESCRIPTION: Creates a green rectangular region at (429, 35) spanning 32 by 56 pixels.
; PLAN: r0=429(x), r1=35(y), r2=32(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 35
LDI r2, 32
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
