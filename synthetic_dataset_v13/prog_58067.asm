; DESCRIPTION: Creates a orange rectangular region at (353, 55) spanning 15 by 111 pixels.
; PLAN: r0=353(x), r1=55(y), r2=15(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 55
LDI r2, 15
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
