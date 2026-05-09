; DESCRIPTION: Creates a orange rectangular region at (106, 18) spanning 111 by 46 pixels.
; PLAN: r0=106(x), r1=18(y), r2=111(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 18
LDI r2, 111
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
