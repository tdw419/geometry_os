; DESCRIPTION: Creates a orange rectangular region at (148, 47) spanning 72 by 92 pixels.
; PLAN: r0=148(x), r1=47(y), r2=72(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 47
LDI r2, 72
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
