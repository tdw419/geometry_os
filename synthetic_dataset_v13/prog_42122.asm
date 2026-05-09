; DESCRIPTION: Creates a orange rectangular region at (140, 105) spanning 72 by 93 pixels.
; PLAN: r0=140(x), r1=105(y), r2=72(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 105
LDI r2, 72
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
