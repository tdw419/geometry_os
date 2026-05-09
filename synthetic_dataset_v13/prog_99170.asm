; DESCRIPTION: Creates a orange rectangular region at (153, 33) spanning 77 by 92 pixels.
; PLAN: r0=153(x), r1=33(y), r2=77(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 33
LDI r2, 77
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
