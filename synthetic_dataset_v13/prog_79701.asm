; DESCRIPTION: Creates a orange rectangular region at (317, 74) spanning 78 by 51 pixels.
; PLAN: r0=317(x), r1=74(y), r2=78(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 74
LDI r2, 78
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
