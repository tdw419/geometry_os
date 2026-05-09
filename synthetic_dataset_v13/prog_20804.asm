; DESCRIPTION: Creates a magenta rectangular region at (337, 90) spanning 91 by 96 pixels.
; PLAN: r0=337(x), r1=90(y), r2=91(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 90
LDI r2, 91
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
