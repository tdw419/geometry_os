; DESCRIPTION: Creates a magenta rectangular region at (333, 80) spanning 73 by 106 pixels.
; PLAN: r0=333(x), r1=80(y), r2=73(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 80
LDI r2, 73
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
