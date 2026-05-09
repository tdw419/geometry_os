; DESCRIPTION: Creates a orange rectangular region at (360, 9) spanning 51 by 57 pixels.
; PLAN: r0=360(x), r1=9(y), r2=51(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 9
LDI r2, 51
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
