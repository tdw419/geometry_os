; DESCRIPTION: Creates a orange rectangular region at (111, 40) spanning 35 by 46 pixels.
; PLAN: r0=111(x), r1=40(y), r2=35(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 40
LDI r2, 35
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
