; DESCRIPTION: Creates a magenta rectangular region at (117, 188) spanning 117 by 33 pixels.
; PLAN: r0=117(x), r1=188(y), r2=117(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 188
LDI r2, 117
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
