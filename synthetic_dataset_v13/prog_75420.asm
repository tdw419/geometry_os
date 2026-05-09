; DESCRIPTION: Creates a orange rectangular region at (266, 20) spanning 51 by 90 pixels.
; PLAN: r0=266(x), r1=20(y), r2=51(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 20
LDI r2, 51
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
