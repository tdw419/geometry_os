; DESCRIPTION: Creates a magenta rectangular region at (123, 174) spanning 53 by 47 pixels.
; PLAN: r0=123(x), r1=174(y), r2=53(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 174
LDI r2, 53
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
