; DESCRIPTION: Creates a orange rectangular region at (124, 74) spanning 51 by 70 pixels.
; PLAN: r0=124(x), r1=74(y), r2=51(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 74
LDI r2, 51
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
