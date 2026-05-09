; DESCRIPTION: Creates a magenta rectangular region at (103, 33) spanning 96 by 47 pixels.
; PLAN: r0=103(x), r1=33(y), r2=96(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 33
LDI r2, 96
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
