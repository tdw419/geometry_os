; DESCRIPTION: Creates a magenta rectangular region at (39, 153) spanning 29 by 54 pixels.
; PLAN: r0=39(x), r1=153(y), r2=29(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 153
LDI r2, 29
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
