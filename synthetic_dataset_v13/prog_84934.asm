; DESCRIPTION: Creates a orange rectangular region at (107, 74) spanning 55 by 92 pixels.
; PLAN: r0=107(x), r1=74(y), r2=55(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 74
LDI r2, 55
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
