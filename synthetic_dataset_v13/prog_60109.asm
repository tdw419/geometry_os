; DESCRIPTION: Creates a magenta rectangular region at (369, 70) spanning 109 by 37 pixels.
; PLAN: r0=369(x), r1=70(y), r2=109(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 70
LDI r2, 109
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
