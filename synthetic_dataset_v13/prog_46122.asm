; DESCRIPTION: Creates a orange rectangular region at (324, 83) spanning 22 by 111 pixels.
; PLAN: r0=324(x), r1=83(y), r2=22(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 83
LDI r2, 22
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
