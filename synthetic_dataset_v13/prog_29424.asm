; DESCRIPTION: Creates a blue rectangular region at (193, 157) spanning 85 by 56 pixels.
; PLAN: r0=193(x), r1=157(y), r2=85(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 157
LDI r2, 85
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
