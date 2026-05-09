; DESCRIPTION: Creates a orange rectangular region at (410, 81) spanning 51 by 18 pixels.
; PLAN: r0=410(x), r1=81(y), r2=51(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 81
LDI r2, 51
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
