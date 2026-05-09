; DESCRIPTION: Creates a orange rectangular region at (442, 138) spanning 56 by 22 pixels.
; PLAN: r0=442(x), r1=138(y), r2=56(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 138
LDI r2, 56
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
