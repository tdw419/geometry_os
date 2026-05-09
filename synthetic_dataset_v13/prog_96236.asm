; DESCRIPTION: Creates a orange rectangular region at (216, 38) spanning 12 by 84 pixels.
; PLAN: r0=216(x), r1=38(y), r2=12(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 38
LDI r2, 12
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
