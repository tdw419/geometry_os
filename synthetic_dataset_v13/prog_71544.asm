; DESCRIPTION: Creates a magenta rectangular region at (371, 136) spanning 66 by 103 pixels.
; PLAN: r0=371(x), r1=136(y), r2=66(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 136
LDI r2, 66
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
