; DESCRIPTION: Creates a orange rectangular region at (314, 140) spanning 48 by 11 pixels.
; PLAN: r0=314(x), r1=140(y), r2=48(width), r3=11(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 140
LDI r2, 48
LDI r3, 11
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
