; DESCRIPTION: Creates a orange rectangular region at (5, 127) spanning 97 by 112 pixels.
; PLAN: r0=5(x), r1=127(y), r2=97(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 127
LDI r2, 97
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
