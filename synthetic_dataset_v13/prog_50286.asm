; DESCRIPTION: Creates a magenta rectangular region at (54, 44) spanning 86 by 69 pixels.
; PLAN: r0=54(x), r1=44(y), r2=86(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 44
LDI r2, 86
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
