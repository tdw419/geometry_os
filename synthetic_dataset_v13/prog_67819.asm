; DESCRIPTION: Creates a magenta rectangular region at (458, 175) spanning 54 by 80 pixels.
; PLAN: r0=458(x), r1=175(y), r2=54(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 175
LDI r2, 54
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
