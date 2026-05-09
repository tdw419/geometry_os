; DESCRIPTION: Creates a orange rectangular region at (203, 187) spanning 111 by 46 pixels.
; PLAN: r0=203(x), r1=187(y), r2=111(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 187
LDI r2, 111
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
