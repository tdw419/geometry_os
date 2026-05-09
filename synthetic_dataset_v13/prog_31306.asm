; DESCRIPTION: Creates a orange rectangular region at (369, 158) spanning 108 by 82 pixels.
; PLAN: r0=369(x), r1=158(y), r2=108(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 158
LDI r2, 108
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
