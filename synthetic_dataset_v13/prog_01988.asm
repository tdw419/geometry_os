; DESCRIPTION: Creates a magenta rectangular region at (326, 80) spanning 60 by 94 pixels.
; PLAN: r0=326(x), r1=80(y), r2=60(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 80
LDI r2, 60
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
