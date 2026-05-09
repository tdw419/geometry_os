; DESCRIPTION: Creates a magenta rectangular region at (237, 119) spanning 120 by 97 pixels.
; PLAN: r0=237(x), r1=119(y), r2=120(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 119
LDI r2, 120
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
