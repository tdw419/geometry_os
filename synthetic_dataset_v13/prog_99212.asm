; DESCRIPTION: Creates a orange rectangular region at (84, 110) spanning 111 by 53 pixels.
; PLAN: r0=84(x), r1=110(y), r2=111(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 110
LDI r2, 111
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
