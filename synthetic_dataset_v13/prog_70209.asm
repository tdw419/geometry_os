; DESCRIPTION: Creates a magenta rectangular region at (153, 10) spanning 40 by 58 pixels.
; PLAN: r0=153(x), r1=10(y), r2=40(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 10
LDI r2, 40
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
