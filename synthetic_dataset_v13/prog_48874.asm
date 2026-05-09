; DESCRIPTION: Creates a magenta rectangular region at (219, 80) spanning 57 by 93 pixels.
; PLAN: r0=219(x), r1=80(y), r2=57(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 80
LDI r2, 57
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
