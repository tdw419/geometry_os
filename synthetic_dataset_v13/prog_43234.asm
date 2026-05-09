; DESCRIPTION: Creates a orange rectangular region at (369, 55) spanning 37 by 83 pixels.
; PLAN: r0=369(x), r1=55(y), r2=37(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 55
LDI r2, 37
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
