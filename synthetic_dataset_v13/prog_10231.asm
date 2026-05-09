; DESCRIPTION: Creates a orange rectangular region at (310, 169) spanning 66 by 25 pixels.
; PLAN: r0=310(x), r1=169(y), r2=66(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 169
LDI r2, 66
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
