; DESCRIPTION: Creates a magenta rectangular region at (160, 172) spanning 103 by 66 pixels.
; PLAN: r0=160(x), r1=172(y), r2=103(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 103
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
