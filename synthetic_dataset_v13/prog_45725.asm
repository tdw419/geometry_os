; DESCRIPTION: Creates a orange rectangular region at (223, 140) spanning 23 by 58 pixels.
; PLAN: r0=223(x), r1=140(y), r2=23(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 140
LDI r2, 23
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
