; DESCRIPTION: Creates a orange rectangular region at (247, 148) spanning 27 by 47 pixels.
; PLAN: r0=247(x), r1=148(y), r2=27(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 148
LDI r2, 27
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
