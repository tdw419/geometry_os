; DESCRIPTION: Creates a magenta rectangular region at (37, 146) spanning 69 by 68 pixels.
; PLAN: r0=37(x), r1=146(y), r2=69(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 146
LDI r2, 69
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
