; DESCRIPTION: Creates a orange rectangular region at (28, 35) spanning 117 by 111 pixels.
; PLAN: r0=28(x), r1=35(y), r2=117(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 35
LDI r2, 117
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
