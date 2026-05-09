; DESCRIPTION: Creates a magenta rectangular region at (188, 160) spanning 67 by 33 pixels.
; PLAN: r0=188(x), r1=160(y), r2=67(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 160
LDI r2, 67
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
