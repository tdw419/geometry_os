; DESCRIPTION: Creates a magenta rectangular region at (80, 143) spanning 99 by 91 pixels.
; PLAN: r0=80(x), r1=143(y), r2=99(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 143
LDI r2, 99
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
