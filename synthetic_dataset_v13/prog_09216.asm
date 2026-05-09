; DESCRIPTION: Creates a magenta rectangular region at (395, 20) spanning 80 by 116 pixels.
; PLAN: r0=395(x), r1=20(y), r2=80(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 20
LDI r2, 80
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
