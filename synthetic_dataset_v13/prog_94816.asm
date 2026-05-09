; DESCRIPTION: Creates a magenta rectangular region at (336, 124) spanning 68 by 62 pixels.
; PLAN: r0=336(x), r1=124(y), r2=68(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 124
LDI r2, 68
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
