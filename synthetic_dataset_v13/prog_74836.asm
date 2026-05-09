; DESCRIPTION: Creates a magenta rectangular region at (144, 119) spanning 73 by 109 pixels.
; PLAN: r0=144(x), r1=119(y), r2=73(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 119
LDI r2, 73
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
