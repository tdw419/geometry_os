; DESCRIPTION: Creates a purple rectangular region at (184, 188) spanning 89 by 63 pixels.
; PLAN: r0=184(x), r1=188(y), r2=89(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 188
LDI r2, 89
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
