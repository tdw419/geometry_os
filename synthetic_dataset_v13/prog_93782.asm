; DESCRIPTION: Creates a magenta rectangular region at (326, 176) spanning 20 by 13 pixels.
; PLAN: r0=326(x), r1=176(y), r2=20(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 176
LDI r2, 20
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
