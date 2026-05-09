; DESCRIPTION: Creates a orange rectangular region at (376, 2) spanning 51 by 90 pixels.
; PLAN: r0=376(x), r1=2(y), r2=51(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 2
LDI r2, 51
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
