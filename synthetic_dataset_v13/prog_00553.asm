; DESCRIPTION: Creates a orange rectangular region at (90, 145) spanning 62 by 92 pixels.
; PLAN: r0=90(x), r1=145(y), r2=62(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 145
LDI r2, 62
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
