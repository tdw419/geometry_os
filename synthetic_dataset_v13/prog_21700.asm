; DESCRIPTION: Creates a orange rectangular region at (321, 40) spanning 93 by 35 pixels.
; PLAN: r0=321(x), r1=40(y), r2=93(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 40
LDI r2, 93
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
