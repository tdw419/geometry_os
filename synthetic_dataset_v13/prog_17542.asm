; DESCRIPTION: Creates a orange rectangular region at (1, 110) spanning 71 by 92 pixels.
; PLAN: r0=1(x), r1=110(y), r2=71(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 110
LDI r2, 71
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
