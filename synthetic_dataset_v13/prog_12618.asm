; DESCRIPTION: Creates a orange rectangular region at (127, 159) spanning 15 by 40 pixels.
; PLAN: r0=127(x), r1=159(y), r2=15(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 159
LDI r2, 15
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
