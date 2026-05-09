; DESCRIPTION: Creates a orange rectangular region at (63, 153) spanning 92 by 90 pixels.
; PLAN: r0=63(x), r1=153(y), r2=92(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 153
LDI r2, 92
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
