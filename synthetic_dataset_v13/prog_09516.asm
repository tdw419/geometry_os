; DESCRIPTION: Creates a magenta rectangular region at (226, 23) spanning 54 by 40 pixels.
; PLAN: r0=226(x), r1=23(y), r2=54(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 23
LDI r2, 54
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
