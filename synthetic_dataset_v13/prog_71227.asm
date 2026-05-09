; DESCRIPTION: Creates a orange rectangular region at (238, 142) spanning 120 by 92 pixels.
; PLAN: r0=238(x), r1=142(y), r2=120(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 142
LDI r2, 120
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
