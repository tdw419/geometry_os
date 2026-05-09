; DESCRIPTION: Creates a purple rectangular region at (164, 188) spanning 21 by 52 pixels.
; PLAN: r0=164(x), r1=188(y), r2=21(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 188
LDI r2, 21
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
