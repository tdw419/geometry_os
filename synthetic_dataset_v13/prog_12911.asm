; DESCRIPTION: Creates a orange rectangular region at (145, 92) spanning 65 by 25 pixels.
; PLAN: r0=145(x), r1=92(y), r2=65(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 92
LDI r2, 65
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
