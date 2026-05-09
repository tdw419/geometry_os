; DESCRIPTION: Creates a orange rectangular region at (71, 102) spanning 54 by 48 pixels.
; PLAN: r0=71(x), r1=102(y), r2=54(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 102
LDI r2, 54
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
